//
//  HistorySections.swift
//  GamesApp
//
//  Created by xyz mac on 12.06.2022.
//

import Foundation

enum HistorySections: Int, CaseIterable {
    case bestGameSets
    case RPSHistory
    case DiceHistory
    
    var sectionTitle: String {
        switch self {
        case .bestGameSets:
            return L10n.History.Headers.statistics
        case .RPSHistory:
            return L10n.History.Headers.rpsHistory
        case .DiceHistory:
            return L10n.History.Headers.diceHistory
        }
    }
}
