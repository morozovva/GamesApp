//
//  HistoryView.swift
//  GamesApp
//
//  Created by xyz mac on 14.04.2022.
//

import UIKit

enum HistorySections: Int, CaseIterable {
    case bestGameSets
    case RPSHistory
    case DiceHistory
    
    var sectionTitle: String {
        switch self {
        case .bestGameSets:
            return "Статистика"
        case .RPSHistory:
            return "История игры в ✊🏻✌🏻✋🏻"
        case .DiceHistory:
            return "История бросков кубика"
        }
    }
}

class HistoryView: UIView {

    var dataStore = DataStore()
    lazy var dataSource = makeDataSource()
    private var sections: [HistorySections] = [.bestGameSets, .RPSHistory, .DiceHistory]

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: CollectionViewLayoutFactory.historyLayout())
        view.backgroundColor = .systemGroupedBackground
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .systemGroupedBackground
        addSubviews()
        makeConstraints()
        createSnapshot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let cellRegistartion = UICollectionView.CellRegistration<
        UICollectionViewListCell, HistoryCollectionItem.ItemType
    > { cell, indexPath, item in
        switch item {
        case .bestGameSet(configuration: let config):
            cell.contentConfiguration = config
        case .RPSHistory(configuration: let config):
            cell.contentConfiguration = config
        case .DiceHistory(configuration: let config):
            cell.contentConfiguration = config
        }
    }
}


extension HistoryView {
    
    func addSubviews() {
        addSubview(collectionView)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.reuseIdentifier)
    }
    
    func makeConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func makeDataSource() -> UICollectionViewDiffableDataSource<HistorySections, HistoryCollectionItem> {
        let dataSource = UICollectionViewDiffableDataSource<
            HistorySections, HistoryCollectionItem
        >(collectionView: collectionView) { [weak self] collectionView, indexPath, item in
            guard (self?.dataSource.sectionIdentifier(for: indexPath.section)) != nil else {
                return .init(frame: .zero)
            }
            return self?.createCell(with: item.content, for: indexPath)
        }
        dataSource.supplementaryViewProvider = { [weak self] collectionView, elementKind, indexPath in
            guard let header = collectionView.dequeueReusableSupplementaryView(
                        ofKind: elementKind,
                        withReuseIdentifier: HeaderCollectionReusableView.reuseIdentifier,
                        for: indexPath) as? HeaderCollectionReusableView,
                  let model = self?.sections[indexPath.section] else {
                return UICollectionReusableView()
            }
            header.setTitle(title: model.sectionTitle)
            return header
        }
        return dataSource
    }
    
    func createSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<HistorySections, HistoryCollectionItem>()
        snapshot.appendSections([.bestGameSets, .RPSHistory, .DiceHistory])
        snapshot.appendItems(dataStore.bestGameSetArray.map { item in
                .init(content: .bestGameSet(configuration:
                .init(id: item.id, bestRPSSet: item.bestRPSSet, one: item.oneStats, two: item.twoStats, three: item.threeStats, four: item.fourStats, five: item.fiveStats, six: item.sixStats))
            )
        }, toSection: .bestGameSets)
        snapshot.appendItems(dataStore.RPSHistoryArray.map { item in
                .init(content: .RPSHistory(configuration:
                    .init(pcChoise: item.pcChoise, personChoise: item.personChoise, RPSResult: item.RPSResult))
            )
        }, toSection: .RPSHistory)
        snapshot.appendItems(dataStore.diceHistoryArray.map { item in
                .init(content: .DiceHistory(configuration:
                    .init(diceResult: item.diceResult)))
                      }, toSection: .DiceHistory)
        dataSource.apply(snapshot)
    }

    func createCell(with item: HistoryCollectionItem.ItemType, for indexPath: IndexPath) -> UICollectionViewCell? {
        return collectionView.dequeueConfiguredReusableCell(using: cellRegistartion, for: indexPath, item: item)
    }
}
