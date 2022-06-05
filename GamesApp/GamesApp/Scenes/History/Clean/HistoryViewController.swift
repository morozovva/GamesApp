//
//  HistoryViewController.swift
//  GamesApp
//
//  Created by xyz mac on 14.04.2022.
//

import UIKit

protocol HistoryDisplayLogic: AnyObject {
    func displayDiceStats(viewModel: HistoryModels.History.ViewModel.Stats)
    func displayDiceResult(viewModel: HistoryModels.History.ViewModel.Dice)
    func displayRPSResult(viewModel: HistoryModels.History.ViewModel.RPS)
    func displayRPSBestSet(viewModel: HistoryModels.History.ViewModel.BGSet)
}

class HistoryViewController: UIViewController {
    
    private var contentView = HistoryView()
    
    var interactor: HistoryBusinessLogic?
    var router: HistoryDataPassing?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
      super.init(coder: aDecoder)
      setup()
    }
    
    private func setup()
    {
        let viewController = self
        let interactor = HistoryInteractor()
        let presenter = HistoryPresenter()
        let router = HistoryRouter()
        viewController.interactor = interactor
          viewController.router = router
          interactor.presenter = presenter
          presenter.viewController = viewController
          router.viewController = viewController
          router.dataStore = interactor
    }
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "История"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = false
    }
}

extension HistoryViewController {
}

extension HistoryViewController: HistoryDisplayLogic {
    func displayRPSBestSet(viewModel: HistoryModels.History.ViewModel.BGSet) {
        contentView.dataStore.bestGameSetArray.remove(at: 0)
        contentView.dataStore.bestGameSetArray.insert(.init(id: 0, bestRPSSet: viewModel.result, one: 0, two: 0, three: 0, four: 0, five: 0, six: 0), at: 0)
        var currentSnapshot = contentView.dataSource.snapshot()
        currentSnapshot.deleteItems(currentSnapshot.itemIdentifiers(inSection: .bestGameSets))
        currentSnapshot.appendItems(contentView.dataStore.bestGameSetArray.map({ BestGameSetConfiguration in HistoryCollectionItem(content: .bestGameSet(configuration: BestGameSetConfiguration))
        }), toSection: .bestGameSets)
        currentSnapshot.reloadSections([.bestGameSets])
        contentView.dataSource.apply(currentSnapshot)
    }
    
    func displayDiceResult(viewModel: HistoryModels.History.ViewModel.Dice) {
        contentView.dataStore.diceHistoryArray.append(.init(diceResult:"Результат игры: \(viewModel.result.getEmoji())"))
        var currentSnapshot = contentView.dataSource.snapshot()
        currentSnapshot.deleteItems(currentSnapshot.itemIdentifiers(inSection: .DiceHistory))
        currentSnapshot.appendItems(contentView.dataStore.diceHistoryArray.map({ DiceSetConfiguration in HistoryCollectionItem(content: .DiceHistory(configuration: DiceSetConfiguration))
        }), toSection: .DiceHistory)
        currentSnapshot.reloadSections([.DiceHistory])
        contentView.dataSource.apply(currentSnapshot)
    }
    
    func displayDiceStats(viewModel: HistoryModels.History.ViewModel.Stats) {
        contentView.dataStore.bestGameSetArray.remove(at: 1)
        contentView.dataStore.bestGameSetArray.append(.init(id: 1, bestRPSSet: 0, one: viewModel.diceStats[0], two: viewModel.diceStats[1], three: viewModel.diceStats[2], four: viewModel.diceStats[3], five: viewModel.diceStats[4], six: viewModel.diceStats[5]))
        var currentSnapshot = contentView.dataSource.snapshot()
        currentSnapshot.deleteItems(currentSnapshot.itemIdentifiers(inSection: .bestGameSets))
        currentSnapshot.appendItems(contentView.dataStore.bestGameSetArray.map({ BestGameSetConfiguration in HistoryCollectionItem(content: .bestGameSet(configuration: BestGameSetConfiguration))
        }), toSection: .bestGameSets)
        currentSnapshot.reloadSections([.bestGameSets])
        contentView.dataSource.apply(currentSnapshot)
    }
    
    func displayRPSResult(viewModel: HistoryModels.History.ViewModel.RPS) {
        contentView.dataStore.RPSHistoryArray.append(.init(pcChoise: viewModel.bot, personChoise: viewModel.person, RPSResult: viewModel.result))
        var currentSnapshot = contentView.dataSource.snapshot()
        currentSnapshot.deleteItems(currentSnapshot.itemIdentifiers(inSection: .RPSHistory))
        currentSnapshot.appendItems(contentView.dataStore.RPSHistoryArray.map({ RPSSetConfiguration in HistoryCollectionItem(content: .RPSHistory(configuration: RPSSetConfiguration))
        }), toSection: .RPSHistory)
        currentSnapshot.reloadSections([.RPSHistory])
        contentView.dataSource.apply(currentSnapshot)
    }
}
