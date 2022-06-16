//
//  SettingsInteractor.swift
//  GamesApp
//
//  Created by xyz mac on 01.06.2022.
//

import UIKit

protocol SettingsBusinessLogic {
    func showSettings(request: SettingsModels.Settings.Request)
    func changeLanguage(request: SettingsModels.Settings.Request)
    func changeTieMode(request: SettingsModels.Settings.Request)
    var langCheck: Bool {get set}
    var tieCheck: Bool {get set}
}

protocol SettingsDataStore
{
    var langCheck: Bool {get set}
    var tieCheck: Bool {get set}
}

class SettingsInteractor: SettingsBusinessLogic, SettingsDataStore {
    
    let defaults = UserDefaults.standard
    
    var langCheck: Bool
    var tieCheck: Bool
    
    init() {
        self.langCheck = AppData.langState
        self.tieCheck = AppData.tieState
    }
    
    var presenter: SettingsPresentationLogic?
  
    func showSettings(request: SettingsModels.Settings.Request) {
        let response = SettingsModels.Settings.Response(langCheck: langCheck, tieCheck: tieCheck)
        presenter?.presentSettings(response: response)
  }
    
    func changeLanguage(request: SettingsModels.Settings.Request) {
        langCheck = !langCheck
        let response = SettingsModels.Settings.Response(langCheck: langCheck, tieCheck: tieCheck)
        AppData.langState = langCheck
        switch langCheck {
        case true:
            AppData.language = Languages.rus.rawValue
        case false:
            AppData.language = Languages.eng.rawValue
        }
        presenter?.presentSettings(response: response)
    }
    
    func changeTieMode(request: SettingsModels.Settings.Request) {
        tieCheck = !tieCheck
        let response = SettingsModels.Settings.Response(langCheck: langCheck, tieCheck: tieCheck)
        AppData.tieState = tieCheck
        presenter?.presentSettings(response: response)
    }
}
