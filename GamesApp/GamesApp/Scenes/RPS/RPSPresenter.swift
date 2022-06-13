//
//  RPSPresenter.swift
//  GamesApp
//
//  Created by xyz mac on 30.05.2022.
//

import UIKit


protocol RPSPresentationLogic {
    func presentRPSResult(response: RPSModels.Game.Response)
}

class RPSPresenter {
    weak var viewController: RPSDisplayLogic?
}

extension RPSPresenter: RPSPresentationLogic {
    func presentRPSResult(response: RPSModels.Game.Response) {
        let viewModel = RPSModels.Game.ViewModel(botsChoise: response.botsChoise, gameResult: response.gameResult)
        viewController?.displayRPS(viewModel: viewModel)
    }
}
