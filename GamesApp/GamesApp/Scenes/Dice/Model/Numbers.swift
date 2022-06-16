//
//  Model.swift
//  GamesApp
//
//  Created by xyz mac on 11.06.2022.
//

import Foundation

enum Numbers: Int, CaseIterable, Codable{
    case one = 1, two, three, four, five, six
    
    func getEmoji() -> String {
        switch self {
        case .one:
            return "1️⃣"
        case .two:
            return "2️⃣"
        case .three:
            return "3️⃣"
        case .four:
            return "4️⃣"
        case .five:
            return "5️⃣"
        case .six:
            return "6️⃣"
        }
    }
}
