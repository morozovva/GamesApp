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

protocol RPSDataPassing {
    var dataStore: RPSDataStore? { get }
    func passRPSResToHistory()
}

final class RPSRouter: RPSDataPassing {
    
    weak var viewController: RPSViewController?
    var dataStore: RPSDataStore?
    
    func passRPSResToHistory() {
        let destinationVC = viewController?.tabBarController?.viewControllers?[2].childForScreenEdgesDeferringSystemGestures as! HistoryViewController
        var destinationDS = destinationVC.router!.dataStore!
        passRPSResToHistory(source: dataStore!, destination: &destinationDS)
    }
    
    func passRPSResToHistory(source: RPSDataStore, destination: inout HistoryDataStore) {
        destination.RPSResult = source.RPSResult
        destination.RPSBestSet = source.RPSBestSet
    }
}

extension RPSRouter: RPSRoutingLogic {
    func routeToSettings() {
        let vc = SettingsViewController()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

