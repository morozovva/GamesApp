//
//  RPSWorker.swift
//  GamesApp
//
//  Created by xyz mac on 30.05.2022.
//

import UIKit


class RPSWorker {
    
   private enum GameResults {
       case tie, bot, player
       
       var stringValue: String {
           switch self {
           case .tie:
               return L10n.Rps.WinLabel.tie
           case .bot:
               return L10n.Rps.WinLabel.lost
           case .player:
               return L10n.Rps.WinLabel.win
           }
       }
    }
    
    private var bestSetCounter: Int = 0
    private var bestSetSaver: Int = 0
    private var RPSResultArray: [RPSResultModel] = []
    
    private var tieState: Bool = AppData.tieState
    
    func RPCGame(choise: Objects) -> (gameRes: String, botsChoise: String){
        var gameResult = ""
        var botChoise: Objects = .rock
        if !tieState {
            if let temp = Objects.allCases.randomElement() {
                botChoise = temp
            }
        }
        else {
            while botChoise == choise {
                if let temp = Objects.allCases.randomElement() {
                    botChoise = temp
                }
            }
        }
        let gameTuple = (player: choise, bot: botChoise)
        switch gameTuple{
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            bestSetCounter = 0
            gameResult = GameResults.tie.stringValue
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            bestSetCounter+=1
            if bestSetCounter>bestSetSaver {
                bestSetSaver = bestSetCounter
            }
            gameResult = GameResults.player.stringValue
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            bestSetCounter = 0
            gameResult = GameResults.bot.stringValue
        }
        RPSResultArray.append(.init(person: choise.rawValue, bot: botChoise.rawValue, result: gameResult))
        AppData.RPSResult = RPSResultArray
        AppData.RPSBestSet = bestSetSaver
        return (gameResult, botChoise.rawValue)
    }
}
