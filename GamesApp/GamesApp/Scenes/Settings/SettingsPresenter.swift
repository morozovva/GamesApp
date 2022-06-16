//
//  SettingsPresenter.swift
//  GamesApp
//
//  Created by xyz mac on 01.06.2022.
//

import UIKit

protocol SettingsPresentationLogic
{
    func presentSettings(response: SettingsModels.Settings.Response)
}

class SettingsPresenter: SettingsPresentationLogic
{
  weak var viewController: SettingsDisplayLogic?
  
  // MARK: Show available colors
  
  func presentSettings(response: SettingsModels.Settings.Response)
  {
      let viewModel = SettingsModels.Settings.ViewModel(langCheck: response.langCheck, tieCheck: response.tieCheck)
    viewController?.displaySettings(viewModel: viewModel)
  }
}
