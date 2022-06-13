//
//  RPSInteractor.swift
//  GamesApp
//
//  Created by xyz mac on 30.05.2022.
//

import UIKit

protocol RPSBusinessLogic: AnyObject {
    func playRPS(request: RPSModels.Game.Request)
}

class RPSInteractor {
  var presenter: RPSPresentationLogic?
  var worker = RPSWorker()
}

extension RPSInteractor: RPSBusinessLogic {
    func playRPS(request: RPSModels.Game.Request) {
        let workerResult = worker.RPCGame(choise: request.choise)
        let workerResultText = workerResult.gameRes
        let workerResultPic = workerResult.botsChoise
        let response = RPSModels.Game.Response(botsChoise: workerResultPic, gameResult: workerResultText)
        presenter?.presentRPSResult(response: response)
    }
}
