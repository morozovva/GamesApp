//
//  RPSWorker.swift
//  GamesApp
//
//  Created by xyz mac on 30.05.2022.
//

import UIKit

enum Objects:String, CaseIterable{
    case rock = "✊🏻", paper = "✋🏻", scissors = "✌🏻"
}

class RPSWorker {
    
    private var bestSetCounter: Int = 0
    private var bestSetSaver: Int = 0
    
    private var dictionary: Translatable = RPSDict.russianGame()
    private var tieState: Bool = true
    
    func changeLangState(_ state: Bool) {
        switch state{
        case true:
            dictionary = RPSDict.russianGame()
        case false:
            dictionary = RPSDict.englishGame()
        }
    }
    
    func changeTieMode(_ state: Bool){
        tieState = state
    }
    
    func RPCGame(choise: Objects) -> (gameRes: String, botsChoise: String, bestSet: Int){
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
            gameResult = dictionary.getText(0)
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            bestSetCounter+=1
            if bestSetCounter>bestSetSaver {
                bestSetSaver = bestSetCounter
            }
            gameResult = dictionary.getText(2)
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            bestSetCounter = 0
            gameResult = dictionary.getText(1)
        }
        return (gameResult, botChoise.rawValue, bestSet: bestSetSaver)
    }
}

