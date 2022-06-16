//
//  DicePresenter.swift
//  GamesApp
//
//  Created by xyz mac on 29.05.2022.
//

import UIKit


protocol DicePresentationLogic: AnyObject {
    func presentDiceRolling(response: DiceModels.Rolling.Response)
    func presentGameReverting(response: DiceModels.Reverting.Response)
}

class DicePresenter {
  weak var viewController: DiceDisplayLogic?
}

extension DicePresenter: DicePresentationLogic {
    func presentDiceRolling(response: DiceModels.Rolling.Response) {
        let viewModel = DiceModels.Rolling.ViewModel(shownLabel: response.shownLabel)
        viewController?.displayDiceRolling(viewModel: viewModel)
    }
    
    func presentGameReverting(response: DiceModels.Reverting.Response) {
        let viewModel = DiceModels.Reverting.ViewModel()
        viewController?.displayDiceReverting(viewModel: viewModel)
    }
}
