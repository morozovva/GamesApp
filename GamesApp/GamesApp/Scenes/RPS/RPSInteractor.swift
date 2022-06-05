//
//  RPSInteractor.swift
//  GamesApp
//
//  Created by xyz mac on 30.05.2022.
//

import UIKit

protocol RPSBusinessLogic: AnyObject {
    func playRPS(request: RPSModels.Game.Request)
    var RPSResult: [String] {get set}
    var RPSBestSet: Int {get set}
}

protocol RPSDataStore {
    var language: Bool? { get set }
    var tie: Bool? {get set}
    var RPSResult: [String] {get set}
    var RPSBestSet: Int {get set}
}

class RPSInteractor: RPSDataStore  {
    
    var language: Bool? {
        didSet
        {
            let request = RPSModels.Game.Request.Settings()
            changeLangState(request: request)
        }
      }
    var tie: Bool? {
        didSet
        {
            let request = RPSModels.Game.Request.Settings()
            changeTieMode(request: request)
        }
    }
    
    var RPSResult = [String](repeating: "", count: 3)
    var RPSBestSet: Int = 0
    
  var presenter: RPSPresentationLogic?
  var worker = RPSWorker()
    
}

extension RPSInteractor: RPSBusinessLogic {
    
    func changeLangState(request: RPSModels.Game.Request.Settings) {
        if let language = language {
            worker.changeLangState(language)
        }
    }
    
    func changeTieMode(request: RPSModels.Game.Request.Settings) {
        if let tie = tie {
            worker.changeTieMode(tie)
        }
    }
    
    func playRPS(request: RPSModels.Game.Request) {
        let workerResult = worker.RPCGame(choise: request.choise)
        let workerResultText = workerResult.gameRes
        let workerResultPic = workerResult.botsChoise
        RPSResult[0] = request.choise.rawValue
        RPSResult[1] = workerResultPic
        RPSResult[2] = workerResultText
        RPSBestSet = workerResult.bestSet
        let response = RPSModels.Game.Response(botsChoise: workerResultPic, gameResult: workerResultText)
        presenter?.showRPSResult(response: response)
    }
}

