//
//  DiceModels.swift
//  GamesApp
//
//  Created by xyz mac on 29.05.2022.
//

import UIKit

enum DiceModels{
  
  enum States {
    struct Request {
        var buttonState: Bool
    }
    struct Response {
        struct Play {
            var shownLabel: Numbers
            var buttonName: String
        }
        var buttonName: String
    }
    struct ViewModel {
        struct Play {
            var shownLabel: Numbers
            var buttonName: String
        }
        var buttonName: String
    }
  }
}
