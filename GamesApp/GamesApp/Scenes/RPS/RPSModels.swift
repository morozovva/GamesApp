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
}
