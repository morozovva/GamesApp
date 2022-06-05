//
//  CollectionViewLayoutFactory.swift
//  GamesApp
//
//  Created by xyz mac on 14.04.2022.
//

import UIKit

public enum CollectionViewLayoutFactory {
    
    static func historyLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = HistorySections(rawValue: sectionIndex) else { return nil }
            switch sectionKind {
            case .bestGameSets:
                    return CollectionViewLayoutFactory.createHistoryZeroSectionLayout()
            case .RPSHistory:
                return CollectionViewLayoutFactory.createHistoryFirstSectionLayout(layoutEnvironment: layoutEnvironment)
            case .DiceHistory:
                return CollectionViewLayoutFactory.createHistorSecondSectionLayout(layoutEnvironment: layoutEnvironment)
            }
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
}


private extension CollectionViewLayoutFactory {
    
    static func createHistoryZeroSectionLayout() -> NSCollectionLayoutSection {
        let supplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(30)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
                ]
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.95),
            heightDimension: .fractionalHeight(0.35))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
        section.boundarySupplementaryItems = supplementaryItems
        return section
    }
    
    static func createHistoryFirstSectionLayout(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let supplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(30)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
                ]
        let section = NSCollectionLayoutSection.list(using: .init(appearance: .insetGrouped), layoutEnvironment: layoutEnvironment)
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 15, trailing: 15)
        section.boundarySupplementaryItems = supplementaryItems
        return section
    }
    
    static func createHistorSecondSectionLayout(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let supplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(30)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
                ]
        let section = NSCollectionLayoutSection.list(using: .init(appearance: .insetGrouped), layoutEnvironment: layoutEnvironment)
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 20, trailing: 15)
        section.boundarySupplementaryItems = supplementaryItems
        return section
    }
}
