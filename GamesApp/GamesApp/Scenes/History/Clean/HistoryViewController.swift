//
//  HistoryViewController.swift
//  GamesApp
//
//  Created by xyz mac on 14.04.2022.
//

import UIKit

protocol HistoryDisplayLogic: AnyObject {
    func displayDiceStats(viewModel: HistoryModels.DiceStats.ViewModel)
    func displayDiceResult(viewModel: HistoryModels.DiceResult.ViewModel)
    func displayRPSResult(viewModel: HistoryModels.RPSResult.ViewModel)
    func displayRPSBestSet(viewModel: HistoryModels.RPSBestSet.ViewModel)
}

class HistoryViewController: UIViewController {
    
    private var contentView: HistoryViewDisplay? = HistoryView()
    
    var interactor: HistoryBusinessLogic?
    
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
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    override func loadView() {
        view = contentView as? UIView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = L10n.Navigation.history
        let RPSRequest = HistoryModels.RPSResult.Request()
        interactor?.updateRPSResult(request: RPSRequest)
        let RPSBestSetRequest = HistoryModels.RPSBestSet.Request()
        interactor?.updateRPSBestSet(request: RPSBestSetRequest)
        let statsRequest = HistoryModels.DiceStats.Request()
        interactor?.updateDiceStats(request: statsRequest)
        let diceRequest = HistoryModels.DiceResult.Request()
        interactor?.updateDiceResult(request: diceRequest)
    }
}

extension HistoryViewController: HistoryDisplayLogic {
    func displayRPSBestSet(viewModel: HistoryModels.RPSBestSet.ViewModel) {
        contentView?.displayRPSBestSet(result: viewModel.result)
    }
    
    func displayDiceResult(viewModel: HistoryModels.DiceResult.ViewModel) {
        contentView?.displayDiceResult(result: viewModel.result)
    }
    
    func displayDiceStats(viewModel: HistoryModels.DiceStats.ViewModel) {
        contentView?.displayDiceStats(diceStats: viewModel.diceStats)
    }
    
    func displayRPSResult(viewModel: HistoryModels.RPSResult.ViewModel) {
        contentView?.displayRPSResult(result: viewModel.RPSResult)
    }
}
