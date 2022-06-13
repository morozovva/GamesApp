//
//  UserDefaults.swift
//  GamesApp
//
//  Created by xyz mac on 12.06.2022.
//

import Foundation

struct AppData {

    @UserDefault(key: "language", defaultValue: Languages.rus.rawValue)
    static var language: String
    
    @UserDefault(key: "langState", defaultValue: true)
    static var langState: Bool
    
    @UserDefault(key: "tie", defaultValue: true)
    static var tieState: Bool
    
    @UserDefault(key: "diceResult", defaultValue: [])
    static var diceResult: [Numbers]
    
    @UserDefault(key: "diceStatistics", defaultValue: DiceDroppingStatistics(onePercentage: 0, twoPercentage: 0, threePercentage: 0, fourPercentage: 0, fivePercentage: 0, sixPercentage: 0))
    static var diceStatistics: DiceDroppingStatistics
    
    @UserDefault(key: "RPSResult", defaultValue: [])
    static var RPSResult: [RPSResultModel]
    
    @UserDefault(key: "RPSBestSet", defaultValue: 0)
    static var RPSBestSet: Int
}
