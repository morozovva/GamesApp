//
//  DiceWorker.swift
//  GamesApp
//
//  Created by xyz mac on 29.05.2022.
//

import UIKit


protocol DiceWorkerLogic {
    func rollTheDice() -> Numbers
}

class DiceWorker {
    private var allDiceCounter: Double = 0
    private var oneCounter: Double = 0
    private var twoCounter: Double = 0
    private var threeCounter: Double = 0
    private var fourCounter: Double = 0
    private var fiveCounter: Double = 0
    private var sixCounter: Double = 0
    private var chosenArray: [Numbers] = []
}

extension DiceWorker: DiceWorkerLogic {
    func rollTheDice() -> Numbers {
        let chosen = Numbers.allCases.randomElement() ?? .one
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
        AppData.diceStatistics = DiceDroppingStatistics(
                                onePercentage: oneCounter/allDiceCounter,
                                twoPercentage: twoCounter/allDiceCounter,
                                threePercentage: threeCounter/allDiceCounter,
                                fourPercentage: fourCounter/allDiceCounter,
                                fivePercentage: fiveCounter/allDiceCounter,
                                sixPercentage: sixCounter/allDiceCounter)
        chosenArray.append(chosen)
        AppData.diceResult = chosenArray
        return chosen
    }
}
