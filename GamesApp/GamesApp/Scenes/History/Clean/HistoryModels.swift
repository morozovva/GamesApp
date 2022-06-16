//
//  HistoryModels.swift
//  GamesApp
//
//  Created by xyz mac on 02.06.2022.
//

import UIKit

enum HistoryModels {
    
    enum DiceResult {
        struct Request {}
        struct Response {
            var result: [Numbers]
        }
        struct ViewModel {
            var result: [Numbers]
        }
    }
    enum DiceStats {
        struct Request {}
        struct Response {
            var diceStats: DiceDroppingStatistics
        }
        struct ViewModel {
            var diceStats: DiceDroppingStatistics
        }
    }
    enum RPSResult {
        struct Request {}
        struct Response {
            var RPSResult: [RPSResultModel]
        }
        struct ViewModel {
            var RPSResult: [RPSResultModel]
        }
    }
    enum RPSBestSet {
        struct Request {}
        struct Response {
            var result: Int
        }
        struct ViewModel {
            var result: Int
        }
    }
}
