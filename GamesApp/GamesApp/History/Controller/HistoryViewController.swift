//
//  HistoryViewController.swift
//  GamesApp
//
//  Created by xyz mac on 14.04.2022.
//

import UIKit

class HistoryViewController: UIViewController {
    
    private var contentView = HistoryView()
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "История"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = false
    }
}

extension HistoryViewController : GameViewControllerDelegate, RPSViewControllerDelegate{
    
    func getBestSet(number: Int) {
        contentView.dataStore.bestGameSetArray.remove(at: 0)
        contentView.dataStore.bestGameSetArray.insert(.init(id: 0, bestRPSSet: number, one: 0, two: 0, three: 0, four: 0, five: 0, six: 0), at: 0)
        var currentSnapshot = contentView.dataSource.snapshot()
        currentSnapshot.deleteItems(currentSnapshot.itemIdentifiers(inSection: .bestGameSets))
        currentSnapshot.appendItems(contentView.dataStore.bestGameSetArray.map({ BestGameSetConfiguration in HistoryCollectionItem(content: .bestGameSet(configuration: BestGameSetConfiguration))
        }), toSection: .bestGameSets)
        currentSnapshot.reloadSections([.bestGameSets])
        contentView.dataSource.apply(currentSnapshot)
    }
    
    func getDiceStats(one: Double, two: Double, three: Double, four: Double, five: Double, six: Double) {
        contentView.dataStore.bestGameSetArray.remove(at: 1)
        contentView.dataStore.bestGameSetArray.append(.init(id: 1, bestRPSSet: 0, one: one, two: two, three: three, four: four, five: five, six: six))
        var currentSnapshot = contentView.dataSource.snapshot()
        currentSnapshot.deleteItems(currentSnapshot.itemIdentifiers(inSection: .bestGameSets))
        currentSnapshot.appendItems(contentView.dataStore.bestGameSetArray.map({ BestGameSetConfiguration in HistoryCollectionItem(content: .bestGameSet(configuration: BestGameSetConfiguration))
        }), toSection: .bestGameSets)
        currentSnapshot.reloadSections([.bestGameSets])
        contentView.dataSource.apply(currentSnapshot)
    }
    
    func getRPSData(personRes: String, pcRes: String, RPSRes: String) {
        contentView.dataStore.RPSHistoryArray.append(.init(pcChoise: pcRes, personChoise: personRes, RPSResult: RPSRes))
        var currentSnapshot = contentView.dataSource.snapshot()
        currentSnapshot.deleteItems(currentSnapshot.itemIdentifiers(inSection: .RPSHistory))
        currentSnapshot.appendItems(contentView.dataStore.RPSHistoryArray.map({ RPSSetConfiguration in HistoryCollectionItem(content: .RPSHistory(configuration: RPSSetConfiguration))
        }), toSection: .RPSHistory)
        currentSnapshot.reloadSections([.RPSHistory])
        contentView.dataSource.apply(currentSnapshot)
    }
    
    func getDiceHistory(diceData: String) {
        contentView.dataStore.diceHistoryArray.append(.init(diceResult:"Результат игры: \(diceData)"))
        var currentSnapshot = contentView.dataSource.snapshot()
        currentSnapshot.deleteItems(currentSnapshot.itemIdentifiers(inSection: .DiceHistory))
        currentSnapshot.appendItems(contentView.dataStore.diceHistoryArray.map({ DiceSetConfiguration in HistoryCollectionItem(content: .DiceHistory(configuration: DiceSetConfiguration))
        }), toSection: .DiceHistory)
        currentSnapshot.reloadSections([.DiceHistory])
        contentView.dataSource.apply(currentSnapshot)
    }
}
