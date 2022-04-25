//
//  DataStore.swift
//  GamesApp
//
//  Created by xyz mac on 14.04.2022.
//

import UIKit

public struct DataStore{
    var bestGameSetArray : [BestGameSetConfiguration] = [
        .init(id: 0, bestRPSSet: 0, one: 0.0, two: 0.0, three: 0.0, four: 0.0, five: 0.0, six: 0.0),
        .init(id: 1, bestRPSSet: 0, one: 0.0, two: 0.0, three: 0.0, four: 0.0, five: 0.0, six: 0.0)
    ]
    var RPSHistoryArray : [RPSSetConfiguration] = []
    var diceHistoryArray: [DiceSetConfiguration] = []
}
