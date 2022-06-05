//
//  DicePresenter.swift
//  GamesApp
//
//  Created by xyz mac on 29.05.2022.
//

import UIKit


protocol DicePresentationLogic: AnyObject {
    func showResult(response: DiceModels.States.Response.Play)
    func revertGame(response: DiceModels.States.Response)
}

class DicePresenter {
  weak var viewController: DiceDisplayLogic?
}

extension DicePresenter: DicePresentationLogic {
    func showResult(response: DiceModels.States.Response.Play) {
        let viewModel = DiceModels.States.ViewModel.Play(shownLabel: response.shownLabel, buttonName: response.buttonName)
        viewController?.getTheDice(viewModel: viewModel)
    }
    
    func revertGame(response: DiceModels.States.Response) {
        let viewModel = DiceModels.States.ViewModel(buttonName: response.buttonName)
        viewController?.revertDice(viewModel: viewModel)
    }
}
