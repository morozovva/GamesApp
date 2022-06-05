//
//  HistoryPresenter.swift
//  GamesApp
//
//  Created by xyz mac on 02.06.2022.
//

import UIKit


protocol HistoryPresentationLogic {
    func presentDiceStats(response: HistoryModels.History.Response.Stats)
    func presentDiceResult(response: HistoryModels.History.Response.Dice)
    func presentRPSResult(response: HistoryModels.History.Response.RPS)
    func presentRPSBestSet(response: HistoryModels.History.Response.BGSet)
}

class HistoryPresenter {
  weak var viewController: HistoryDisplayLogic?
    
}

extension HistoryPresenter: HistoryPresentationLogic {
    func presentRPSBestSet(response: HistoryModels.History.Response.BGSet) {
        let viewModel = HistoryModels.History.ViewModel.BGSet(result: response.result)
        viewController?.displayRPSBestSet(viewModel: viewModel)
    }
    
    func presentRPSResult(response: HistoryModels.History.Response.RPS) {
        let viewModel = HistoryModels.History.ViewModel.RPS(person: response.person, bot: response.bot, result: response.result)
        viewController?.displayRPSResult(viewModel: viewModel)
    }
    
    func presentDiceResult(response: HistoryModels.History.Response.Dice) {
        let viewModel = HistoryModels.History.ViewModel.Dice(result: response.result)
        viewController?.displayDiceResult(viewModel: viewModel)
    }
    
    func presentDiceStats(response: HistoryModels.History.Response.Stats) {
        let viewModel = HistoryModels.History.ViewModel.Stats(diceStats: response.diceStats)
        viewController?.displayDiceStats(viewModel: viewModel)
    }
}

