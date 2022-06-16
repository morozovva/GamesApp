// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Dice {
    internal enum Reverting {
      /// Repeat
        internal static var title: String {
            L10n.tr("Localizable", "Dice.Reverting.Title")
        }
    }
    internal enum Rolling {
      /// Roll the dice
        internal static var title: String {
            L10n.tr("Localizable", "Dice.Rolling.Title")
        }
    }
  }

  internal enum History {
    internal enum DiceHistory {
      /// Game result: 
        internal static var text: String {
            L10n.tr("Localizable", "History.DiceHistory.Text")
        }
    }
    internal enum DiceStats {
      /// Dice rolling statistics
        internal static var title: String {
            L10n.tr("Localizable", "History.DiceStats.Title")
        }
    }
    internal enum Headers {
      /// Dice rolling history
        internal static var diceHistory: String {
            L10n.tr("Localizable", "History.Headers.DiceHistory")
        }
      /// ✊🏻✋🏻✌🏻 History
        internal static var rpsHistory: String {
            L10n.tr("Localizable", "History.Headers.RPSHistory")
        }
      /// Statistics
        internal static var statistics: String {
            L10n.tr("Localizable", "History.Headers.Statistics")
        }
    }
    internal enum RPSBestSet {
      ///  wins in a row
        internal static var subTitle: String {
            L10n.tr("Localizable", "History.RPSBestSet.SubTitle")
        }
      /// Highest number of wins in a row in ✊🏻✋🏻✌🏻
        internal static var title: String {
            L10n.tr("Localizable", "History.RPSBestSet.Title")
        }
    }
    internal enum RPSHistory {
      /// Bot's choise: 
        internal static var bot: String {
            L10n.tr("Localizable", "History.RPSHistory.Bot")
        }
      /// Your choise: 
        internal static var person: String {
            L10n.tr("Localizable", "History.RPSHistory.Person")
        }
      /// Game result: 
        internal static var result: String {
            L10n.tr("Localizable", "History.RPSHistory.Result")
        }
    }
  }

  internal enum Navigation {
    /// Dice Rolling
      internal static var dice: String {
          L10n.tr("Localizable", "Navigation.Dice")
      }
    /// History
      internal static var history: String {
          L10n.tr("Localizable", "Navigation.History")
      }
    /// Rock Paper Scissors
      internal static var rps: String {
          L10n.tr("Localizable", "Navigation.RPS")
      }
    /// Settings
      internal static var settings: String {
          L10n.tr("Localizable", "Navigation.Settings")
      }
  }

  internal enum Rps {
    /// Play again
      internal static var button: String {
          L10n.tr("Localizable", "RPS.Button")
      }
    internal enum WinLabel {
      /// You lost🥺
        internal static var lost: String {
            L10n.tr("Localizable", "RPS.WinLabel.Lost")
        }
      /// It's a tie😐
        internal static var tie: String {
            L10n.tr("Localizable", "RPS.WinLabel.Tie")
        }
      /// You won😎
        internal static var win: String {
            L10n.tr("Localizable", "RPS.WinLabel.Win")
        }
    }
  }

  internal enum Settings {
    /// Set English language
      internal static var english: String {
          L10n.tr("Localizable", "Settings.English")
      }
    /// Enable tie
      internal static var tieMode: String {
          L10n.tr("Localizable", "Settings.TieMode")
      }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
      let lang = AppData.language
      let path = Bundle.main.path(forResource: lang, ofType: "lproj")
      let bundle = Bundle(path: path!)
    return NSLocalizedString(key, tableName: table, bundle: bundle!, comment: "")
  }
}
