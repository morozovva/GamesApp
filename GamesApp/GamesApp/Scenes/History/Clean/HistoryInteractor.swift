//
//  HistoryInteractor.swift
//  GamesApp
//
//  Created by xyz mac on 02.06.2022.
//

import UIKit

protocol HistoryBusinessLogic: AnyObject {
    func updateDiceStats(request: HistoryModels.History.Request.Stats)
    func updateDiceResult(request: HistoryModels.History.Request.Dice)
    func updateRPSResult(request: HistoryModels.History.Request.RPS)
    func updateRPSBestSet(request: HistoryModels.History.Request.BGSet)
}

protocol HistoryDataStore {
    var stats: [Double] { get set }
    var diceResult: Numbers? {get set}
    var RPSResult: [String] {get set}
    var RPSBestSet: Int? {get set}
}

class HistoryInteractor: HistoryDataStore  {
    var stats = [Double](repeating: 0.0, count: 6) {
        didSet
        {
            let request = HistoryModels.History.Request.Stats()
            updateDiceStats(request: request)
        }
      }
    
    var diceResult: Numbers? {
        didSet
        {
            let request = HistoryModels.History.Request.Dice()
            updateDiceResult(request: request)
        }
      }
    
    var RPSResult = [String](repeating: "", count: 3) {
        didSet
        {
            let request = HistoryModels.History.Request.RPS()
            updateRPSResult(request: request)
        }
      }
    
    var RPSBestSet: Int? {
        didSet
        {
            let request = HistoryModels.History.Request.BGSet()
            updateRPSBestSet(request: request)
        }
      }
    
    var presenter: HistoryPresentationLogic?
    var worker = HistoryWorker()
    
}

extension HistoryInteractor: HistoryBusinessLogic {
    
    func updateRPSBestSet(request: HistoryModels.History.Request.BGSet) {
        if let RPSBestSet = RPSBestSet {
            let response = HistoryModels.History.Response.BGSet(result: RPSBestSet)
            presenter?.presentRPSBestSet(response: response)
        }
    }
    
    func updateDiceResult(request: HistoryModels.History.Request.Dice) {
        if let diceResult = diceResult {
            let response = HistoryModels.History.Response.Dice(result: diceResult)
            presenter?.presentDiceResult(response: response)
        }
    }
    
    func updateDiceStats(request: HistoryModels.History.Request.Stats) {
        let response = HistoryModels.History.Response.Stats(diceStats: stats)
        presenter?.presentDiceStats(response: response)
    }
    
    func updateRPSResult(request: HistoryModels.History.Request.RPS) {
        let response = HistoryModels.History.Response.RPS(person: RPSResult[0], bot: RPSResult[1], result: RPSResult[2])
        presenter?.presentRPSResult(response: response)
    }
}
