//
//  HistoryPresenter.swift
//  GamesApp
//
//  Created by xyz mac on 02.06.2022.
//

import UIKit


protocol HistoryPresentationLogic {
    func presentDiceResult(response: HistoryModels.DiceResult.Response)
    func presentDiceStats(response: HistoryModels.DiceStats.Response)
    func presentRPSResult(response: HistoryModels.RPSResult.Response)
    func presentRPSBestSet(response: HistoryModels.RPSBestSet.Response)
}

class HistoryPresenter {
  weak var viewController: HistoryDisplayLogic?
    
}

extension HistoryPresenter: HistoryPresentationLogic {
    func presentRPSBestSet(response: HistoryModels.RPSBestSet.Response) {
        let viewModel = HistoryModels.RPSBestSet.ViewModel(result: response.result)
        viewController?.displayRPSBestSet(viewModel: viewModel)
    }
    
    func presentRPSResult(response: HistoryModels.RPSResult.Response) {
        let viewModel = HistoryModels.RPSResult.ViewModel(RPSResult: response.RPSResult)
        viewController?.displayRPSResult(viewModel: viewModel)
    }
    
    func presentDiceResult(response: HistoryModels.DiceResult.Response) {
        let viewModel = HistoryModels.DiceResult.ViewModel(result: response.result)
        viewController?.displayDiceResult(viewModel: viewModel)
    }
    
    func presentDiceStats(response: HistoryModels.DiceStats.Response) {
        let viewModel = HistoryModels.DiceStats.ViewModel(diceStats: response.diceStats)
        viewController?.displayDiceStats(viewModel: viewModel)
    }
}

