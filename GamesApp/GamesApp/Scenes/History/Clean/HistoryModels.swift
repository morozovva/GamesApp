//
//  HistoryModels.swift
//  GamesApp
//
//  Created by xyz mac on 02.06.2022.
//

import UIKit

enum HistoryModels {
    enum History {
        struct Request {
            struct Dice {}
            struct Stats {}
            struct RPS {}
            struct BGSet {}
        }
        struct Response {
            struct Dice {
                var result: Numbers
            }
            struct Stats {
                var diceStats: [Double]
            }
            struct RPS{
                var person: String
                var bot: String
                var result: String
            }
            struct BGSet{
                var result: Int
            }
        }
        struct ViewModel {
            struct Dice {
                var result: Numbers
            }
            struct Stats {
                var diceStats: [Double]
            }
            struct RPS{
                var person: String
                var bot: String
                var result: String
            }
            struct BGSet{
                var result: Int
            }
        }
    }
}
