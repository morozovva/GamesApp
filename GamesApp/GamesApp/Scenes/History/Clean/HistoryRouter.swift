//
//  HistoryRouter.swift
//  GamesApp
//
//  Created by xyz mac on 02.06.2022.
//

import UIKit


protocol HistoryDataPassing {
  var dataStore: HistoryDataStore? { get }
}

final class HistoryRouter: HistoryDataPassing{
    
    weak var viewController: HistoryViewController?
    var dataStore: HistoryDataStore?
}

extension HistoryRouter {
    
}
