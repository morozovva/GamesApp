//
//  Dictionaries.swift
//  GamesApp
//
//  Created by xyz mac on 02.04.2022.
//

import UIKit

struct russianGame: Translatable{
    var ruTextDict: [String] = ["Ничья😐", "Вы проиграли🥺", "Вы победили😎"]
    
    func getText(_ res: Int) -> String{
        return ruTextDict[res]
    }
}

struct englishGame: Translatable{
var enTextDict: [String] = ["It's a tie😐", "You lost🥺", "You won😎"]
    
    func getText(_ res: Int) -> String {
        return enTextDict[res]
    }
}

protocol Translatable{
    func getText(_ case: Int) -> String
}
