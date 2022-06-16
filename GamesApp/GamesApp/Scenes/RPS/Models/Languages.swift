//
//  Languages.swift
//  GamesApp
//
//  Created by xyz mac on 12.06.2022.
//

import Foundation

enum Languages: String {
    case rus = "ru", eng = "en"
    
    var boolForm: Bool {
        switch self.rawValue {
        case "ru":
            return true
        default:
            return false
        }
    }
}
