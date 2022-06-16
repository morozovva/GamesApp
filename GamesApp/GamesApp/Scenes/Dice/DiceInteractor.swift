//
//  DiceInteractor.swift
//  GamesApp
//
//  Created by xyz mac on 29.05.2022.
//

import UIKit

protocol DiceBusinessLogic: AnyObject {
    func playTheGame(request: DiceModels.Rolling.Request)
    func revertTheGame(request: DiceModels.Reverting.Request)
}

class DiceInteractor: DiceBusinessLogic {
    var presenter: DicePresentationLogic?
    var worker: DiceWorkerLogic?
    
    func playTheGame(request: DiceModels.Rolling.Request) {
        let workerNumber = worker!.rollTheDice()
        let statesRepsonse = DiceModels.Rolling.Response(shownLabel: workerNumber)
        presenter?.presentDiceRolling(response: statesRepsonse)
    }
    
    func revertTheGame(request: DiceModels.Reverting.Request) {
        let response = DiceModels.Reverting.Response()
        presenter?.presentGameReverting(response: response)
    }
}

