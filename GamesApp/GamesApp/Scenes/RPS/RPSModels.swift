//
//  RPSModels.swift
//  GamesApp
//
//  Created by xyz mac on 30.05.2022.
//

import UIKit

enum RPSModels {
    enum Game {
        struct Request {
            var choise: Objects
            struct Settings{}
        }
        struct Response {
            var botsChoise: String
            var gameResult: String
        }
        struct ViewModel {
            var botsChoise: String
            var gameResult: String
        }
    }
    
    enum History {
        struct Request {}
        struct Response {
            var personChoise: String
            var botsChoise: String
            var gameResult: String
        }
        struct ViewModel {
            var personChoise: String
            var botsChoise: String
            var gameResult: String
        }
    }
}
