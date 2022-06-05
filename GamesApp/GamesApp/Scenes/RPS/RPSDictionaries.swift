//
//  Dictionaries.swift
//  GamesApp
//
//  Created by xyz mac on 02.04.2022.
//

import UIKit

protocol Translatable{
    func getText(_ case: Int) -> String
}

enum RPSDict {
    struct russianGame: Translatable{
        let tie = "Ничья😐"
        let bot = "Вы проиграли🥺"
        let player = "Вы победили😎"
        
        func getText(_ res: Int) -> String{
            if res == 0{
                return tie
            }
            else if res == 1{
                return bot
            }
            else {
                return player
            }
        }
    }

    struct englishGame: Translatable{
        let tie = "It's a tie😐"
        let bot = "You lost🥺"
        let player = "You won😎"
        
        func getText(_ res: Int) -> String{
            if res == 0{
                return tie
            }
            else if res == 1{
                return bot
            }
            else {
                return player
            }
        }
    }
}
