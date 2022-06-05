//
//  SettingsModels.swift
//  GamesApp
//
//  Created by xyz mac on 01.06.2022.
//

import UIKit

enum SettingsModels
{
  // MARK: Use cases
  
  enum Settings {
    struct Request {
    }
    struct Response {
        var langCheck: Bool
        var tieCheck: Bool
    }
    struct ViewModel {
        var langCheck: Bool
        var tieCheck: Bool
    }
  }
}
