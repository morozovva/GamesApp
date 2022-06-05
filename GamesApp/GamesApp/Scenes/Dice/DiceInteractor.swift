//
//  DiceInteractor.swift
//  GamesApp
//
//  Created by xyz mac on 29.05.2022.
//

import UIKit

protocol DiceBusinessLogic: AnyObject {
    func playTheGame(request: DiceModels.States.Request)
    var stats: [Double] { get set }
    var diceResult: Numbers {get set}
}

protocol DiceDataStore {
    var stats: [Double] { get set }
    var diceResult: Numbers {get set}
}

class DiceInteractor: DiceBusinessLogic, DiceDataStore {
    
    var diceResult: Numbers = .one
    
    var stats = [Double](repeating: 0.0, count: 6)
    var presenter: DicePresentationLogic?
    var worker: DiceWorkerLogic?
    
    func playTheGame(request: DiceModels.States.Request) {
        switch !request.buttonState {
        case true:
            let workerResult = worker!.rollTheDice()
            stats = workerResult.stats
            let workerButton = workerResult.buttonTitle
            let workerNumber = workerResult.number
            diceResult = workerNumber
            let statesRepsonse = DiceModels.States.Response.Play(shownLabel: workerNumber, buttonName: workerButton)
            presenter?.showResult(response: statesRepsonse)
        case false:
            let workerResult = worker!.renewGame()
            let response = DiceModels.States.Response(buttonName: workerResult)
            presenter?.revertGame(response: response)
        }
    }
}

