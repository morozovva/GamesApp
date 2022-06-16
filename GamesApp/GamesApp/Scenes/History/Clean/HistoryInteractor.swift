//
//  HistoryInteractor.swift
//  GamesApp
//
//  Created by xyz mac on 02.06.2022.
//

import UIKit

protocol HistoryBusinessLogic: AnyObject {
    func updateDiceStats(request: HistoryModels.DiceStats.Request)
    func updateDiceResult(request: HistoryModels.DiceResult.Request)
    func updateRPSResult(request: HistoryModels.RPSResult.Request)
    func updateRPSBestSet(request: HistoryModels.RPSBestSet.Request)
}

class HistoryInteractor {
    var presenter: HistoryPresentationLogic?
}

extension HistoryInteractor: HistoryBusinessLogic {
    
    func updateRPSBestSet(request: HistoryModels.RPSBestSet.Request) {
        let response = HistoryModels.RPSBestSet.Response(result: AppData.RPSBestSet)
        presenter?.presentRPSBestSet(response: response)
    }
    
    func updateDiceResult(request: HistoryModels.DiceResult.Request) {
        let response = HistoryModels.DiceResult.Response(result: AppData.diceResult)
        presenter?.presentDiceResult(response: response)
    }
    
    func updateDiceStats(request: HistoryModels.DiceStats.Request) {
        let response = HistoryModels.DiceStats.Response(diceStats: AppData.diceStatistics)
        presenter?.presentDiceStats(response: response)
    }
    
    func updateRPSResult(request: HistoryModels.RPSResult.Request) {
        let response = HistoryModels.RPSResult.Response(RPSResult: AppData.RPSResult)
        presenter?.presentRPSResult(response: response)
    }
}
