//
//  DiceWorker.swift
//  GamesApp
//
//  Created by xyz mac on 29.05.2022.
//

import UIKit

protocol DiceWorkerLogic {
    func rollTheDice() -> (buttonTitle: String, number: Numbers, stats: [Double])
    func renewGame() -> String
}

class DiceWorker {
    private var allDiceCounter: Double = 0
    private var oneCounter: Double = 0
    private var twoCounter: Double = 0
    private var threeCounter: Double = 0
    private var fourCounter: Double = 0
    private var fiveCounter: Double = 0
    private var sixCounter: Double = 0
}

extension DiceWorker: DiceWorkerLogic {
    func rollTheDice() -> (buttonTitle: String, number: Numbers, stats: [Double]){
        var statistics = [Double](repeating: 0.0, count: 6)
        var chosen: Numbers = .one
        if let chosenNumber = Numbers.allCases.randomElement(){
            chosen = chosenNumber
        }
        allDiceCounter += 1
        switch chosen {
        case .one:
            oneCounter += 1
        case .two:
            twoCounter += 1
        case .three:
            threeCounter += 1
        case .four:
            fourCounter += 1
        case .five:
            fiveCounter += 1
        case .six:
            sixCounter += 1
        }
        statistics = [oneCounter/allDiceCounter, twoCounter/allDiceCounter, threeCounter/allDiceCounter, fourCounter/allDiceCounter, fiveCounter/allDiceCounter, sixCounter/allDiceCounter]
        return (buttonTitle: "Повтор", number: chosen, stats: statistics)
    }
    
    func renewGame() -> String{
        return "Бросить кубик"
    }
}
