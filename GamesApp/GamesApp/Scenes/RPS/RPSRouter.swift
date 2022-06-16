//
//  RPSRouter.swift
//  GamesApp
//
//  Created by xyz mac on 30.05.2022.
//

import UIKit

protocol RPSRoutingLogic {
  func routeToSettings()
}

final class RPSRouter {
    weak var viewController: RPSViewController?
}

extension RPSRouter: RPSRoutingLogic {
    func routeToSettings() {
        let vc = SettingsViewController()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

