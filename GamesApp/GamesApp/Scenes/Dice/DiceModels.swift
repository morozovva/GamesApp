//
//  DiceModels.swift
//  GamesApp
//
//  Created by xyz mac on 29.05.2022.
//

import UIKit

enum DiceModels{
    
    enum Rolling {
        struct Request {}
        struct Response {
            var shownLabel: Numbers
        }
        struct ViewModel {
            var shownLabel: Numbers
        }
    }
    enum Reverting {
        struct Request {}
        struct Response {}
        struct ViewModel {}
    }
}
