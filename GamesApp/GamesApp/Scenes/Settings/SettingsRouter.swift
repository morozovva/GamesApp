//
//  SettingsRouter.swift
//  GamesApp
//
//  Created by xyz mac on 01.06.2022.
//

import UIKit

protocol SettingsDataPassing {
    var dataStore: SettingsDataStore? {get}
}

final class SettingsRouter: SettingsDataPassing {
    
    var dataStore: SettingsDataStore?
    weak var viewController: SettingsViewController?
    
    func passDataToRPS(){
        let destinationVC = viewController?.tabBarController?.viewControllers?[0].children[0] as! RPSViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSecond(source: dataStore!, destination: &destinationDS)
    }
    
    func passDataToSecond(source: SettingsDataStore, destination: inout RPSDataStore) {
        destination.language = source.langCheck
        destination.tie = source.tieCheck
    }
}
