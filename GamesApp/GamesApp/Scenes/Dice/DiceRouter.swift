//
//  DiceRouter.swift
//  GamesApp
//
//  Created by xyz mac on 29.05.2022.
//

import UIKit


protocol DiceDataPassing {
    var dataStore: DiceDataStore? {get}
    func sendDiceResult()
}

final class DiceRouter: DiceDataPassing{
    
    var dataStore: DiceDataStore?
    weak var viewController: DiceViewController?
    
    
    func sendDiceResult() {
        let destinationVC = viewController?.tabBarController?.viewControllers?[2].childForScreenEdgesDeferringSystemGestures as! HistoryViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDiceResToHistory(source: dataStore!, destination: &destinationDS)
    }
    
    func passDiceResToHistory(source: DiceDataStore, destination: inout HistoryDataStore) {
        destination.diceResult = source.diceResult
        destination.stats = source.stats
    }
}
