//
//  HistoryView.swift
//  GamesApp
//
//  Created by xyz mac on 14.04.2022.
//

import UIKit


protocol HistoryViewDisplay: AnyObject {
    func displayRPSBestSet(result: Int)
    func displayDiceResult(result: [Numbers])
    func displayDiceStats(diceStats: DiceDroppingStatistics)
    func displayRPSResult(result: [RPSResultModel])
}

class HistoryView: UIView {

    private var dataStore = DataStore()
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


private extension HistoryView {
    
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

extension HistoryView: HistoryViewDisplay {
    func displayRPSBestSet(result: Int) {
        dataStore.bestGameSetArray.remove(at: 0)
        dataStore.bestGameSetArray.insert(.init(id: 0, bestRPSSet: result, one: 0, two: 0, three: 0, four: 0, five: 0, six: 0), at: 0)
        var currentSnapshot = dataSource.snapshot()
        currentSnapshot.deleteItems(currentSnapshot.itemIdentifiers(inSection: .bestGameSets))
        currentSnapshot.appendItems(dataStore.bestGameSetArray.map({ BestGameSetConfiguration in HistoryCollectionItem(content: .bestGameSet(configuration: BestGameSetConfiguration))
        }), toSection: .bestGameSets)
        currentSnapshot.reloadSections([.bestGameSets])
        dataSource.apply(currentSnapshot)
    }
    
    func displayDiceResult(result: [Numbers]) {
        dataStore.diceHistoryArray.removeAll()
        for result in result {
            dataStore.diceHistoryArray.append(.init(diceResult: "\(L10n.History.DiceHistory.text) \(result.getEmoji())"))
            var currentSnapshot = dataSource.snapshot()
            currentSnapshot.deleteItems(currentSnapshot.itemIdentifiers(inSection: .DiceHistory))
            currentSnapshot.appendItems(dataStore.diceHistoryArray.map({ DiceSetConfiguration in HistoryCollectionItem(content: .DiceHistory(configuration: DiceSetConfiguration))
            }), toSection: .DiceHistory)
            currentSnapshot.reloadSections([.DiceHistory])
            dataSource.apply(currentSnapshot)
        }
    }
    
    func displayDiceStats(diceStats: DiceDroppingStatistics) {
        dataStore.bestGameSetArray.remove(at: 1)
        dataStore.bestGameSetArray.append(
            .init(id: 1, bestRPSSet: 0,
                  one: diceStats.onePercentage,
                  two: diceStats.twoPercentage,
                  three: diceStats.threePercentage,
                  four: diceStats.fourPercentage,
                  five: diceStats.fivePercentage,
                  six: diceStats.sixPercentage))
        var currentSnapshot = dataSource.snapshot()
        currentSnapshot.deleteItems(currentSnapshot.itemIdentifiers(inSection: .bestGameSets))
        currentSnapshot.appendItems(dataStore.bestGameSetArray.map({ BestGameSetConfiguration in HistoryCollectionItem(content: .bestGameSet(configuration: BestGameSetConfiguration))
        }), toSection: .bestGameSets)
        currentSnapshot.reloadSections([.bestGameSets])
        dataSource.apply(currentSnapshot)
    }
    
    func displayRPSResult(result: [RPSResultModel]) {
        dataStore.RPSHistoryArray.removeAll()
        for result in result {
            dataStore.RPSHistoryArray.append(.init(pcChoise: result.bot, personChoise: result.person, RPSResult: result.result))
            var currentSnapshot = dataSource.snapshot()
            currentSnapshot.deleteItems(currentSnapshot.itemIdentifiers(inSection: .RPSHistory))
            currentSnapshot.appendItems(dataStore.RPSHistoryArray.map({ RPSSetConfiguration in HistoryCollectionItem(content: .RPSHistory(configuration: RPSSetConfiguration))
            }), toSection: .RPSHistory)
            currentSnapshot.reloadSections([.RPSHistory])
            dataSource.apply(currentSnapshot)
        }
    }
}
