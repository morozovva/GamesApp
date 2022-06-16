//
//  HistoryCollectionItem.swift
//  GamesApp
//
//  Created by xyz mac on 14.04.2022.
//

import UIKit

struct HistoryCollectionItem: Hashable {
    let uuid = UUID()
    
    enum ItemType {
        case bestGameSet(configuration: BestGameSetConfiguration)
        case RPSHistory(configuration: RPSSetConfiguration)
        case DiceHistory(configuration: DiceSetConfiguration)
    }
    
    let content: ItemType
    
    init(content: ItemType) {
        self.content = content
    }
    
    static func == (lhs: HistoryCollectionItem, rhs: HistoryCollectionItem) -> Bool {
        lhs.uuid == rhs.uuid
    }
    
    func hash(into hasher: inout Hasher) {
//        hash(into: &hasher)
    }
}
