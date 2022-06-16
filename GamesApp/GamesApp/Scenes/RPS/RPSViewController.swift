//
//  RPSViewController.swift
//  GamesApp
//
//  Created by xyz mac on 30.03.2022.
//

import UIKit


protocol RPSDisplayLogic: AnyObject {
    func displayRPS(viewModel: RPSModels.Game.ViewModel)
}

class RPSViewController: UIViewController{
    
  var interactor: RPSBusinessLogic?
  var router: RPSRoutingLogic?
    
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = RPSInteractor()
    let presenter = RPSPresenter()
    let router = RPSRouter()
      viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
  }
  
    let rockImage = UIImage(named: "rock.png")
    let paperImage = UIImage(named: "paper.png")
    let scissorsImage = UIImage(named: "scissors.png")
    
    private lazy var rockButton: UIButton = {
        let rockButton = UIButton()
        rockButton.setImage(rockImage, for: .normal)
        rockButton.addAction(UIAction() { [weak self] _ in
            self?.playButtonAction(choise: .rock)
        }, for: .touchUpInside)
            return rockButton
        }()
    
    private lazy var paperButton: UIButton = {
        let paperButton = UIButton()
        paperButton.setImage(paperImage, for: .normal)
        paperButton.addAction(UIAction() { [weak self] _ in
            self?.playButtonAction(choise: .paper)
        }, for: .touchUpInside)
            return paperButton
        }()
    
    private lazy var scissorsButton: UIButton = {
        let scissorsButton = UIButton()
        scissorsButton.setImage(scissorsImage, for: .normal)
        scissorsButton.addAction(UIAction() { [weak self] _ in
            self?.playButtonAction(choise: .scissors)
        }, for: .touchUpInside)
            return scissorsButton
        }()
    
    private var winnerLabel: UILabel = {
        let winnerLabel = UILabel()
        winnerLabel.font = .systemFont(ofSize: 30, weight: .bold)
        return winnerLabel
    }()
    
    private var botsChoise: UILabel = {
        let botsChoise = UILabel()
        botsChoise.font = .systemFont(ofSize: 100, weight: .bold)
        return botsChoise
    }()
    
    private lazy var restartButton: UIButton = {
        let restartButton = UIButton()
        restartButton.backgroundColor = .white
        restartButton.setTitleColor(.black, for: .normal)
        restartButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        restartButton.addAction(UIAction() { [weak self] _ in
            self?.restart()
        }, for: .touchUpInside)
        restartButton.layer.cornerRadius = 10.0
        restartButton.layer.masksToBounds = true
        restartButton.layer.borderWidth = 4.0
        restartButton.layer.borderColor = UIColor.systemTeal.cgColor
        return restartButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBarIfPossible()
        setupView()
        addConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        restartButton.setTitle(L10n.Rps.button, for: .normal)
        title = L10n.Navigation.rps
    }
}

private extension RPSViewController{
    
    private func addConstraints() {
        rockButton.translatesAutoresizingMaskIntoConstraints = false
        paperButton.translatesAutoresizingMaskIntoConstraints = false
        scissorsButton.translatesAutoresizingMaskIntoConstraints = false
        winnerLabel.translatesAutoresizingMaskIntoConstraints = false
        botsChoise.translatesAutoresizingMaskIntoConstraints = false
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rockButton.rightAnchor.constraint(equalTo: paperButton.leftAnchor),
            rockButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rockButton.widthAnchor.constraint(equalToConstant: 100),
            rockButton.heightAnchor.constraint(equalToConstant: 100),
            
            paperButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paperButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            paperButton.widthAnchor.constraint(equalToConstant: 100),
            paperButton.heightAnchor.constraint(equalToConstant: 100),
            
            scissorsButton.leftAnchor.constraint(equalTo: paperButton.rightAnchor),
            scissorsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scissorsButton.widthAnchor.constraint(equalToConstant: 100),
            scissorsButton.heightAnchor.constraint(equalToConstant: 100),

            winnerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            winnerLabel.bottomAnchor.constraint(equalTo: paperButton.topAnchor),
            winnerLabel.heightAnchor.constraint(equalToConstant: 200),

            botsChoise.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            botsChoise.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            botsChoise.heightAnchor.constraint(equalToConstant: 180),

            restartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            restartButton.topAnchor.constraint(equalTo: botsChoise.bottomAnchor),
            restartButton.heightAnchor.constraint(equalToConstant: 60),
            restartButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func setupNavigationBarIfPossible() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let settingsButton = UIButton()
        settingsButton.setImage(
            UIImage(systemName: "gearshape",
                    withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)),
            for: .normal)
        settingsButton.imageView?.tintColor = .black
        settingsButton.addAction(UIAction() { [weak self] _ in
            self?.settingsButtonAction()
        }, for: .touchUpInside)
        navigationItem.rightBarButtonItems = [ UIBarButtonItem(customView: settingsButton)]
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(rockButton)
        view.addSubview(paperButton)
        view.addSubview(scissorsButton)
        view.addSubview(winnerLabel)
        view.addSubview(botsChoise)
        view.addSubview(restartButton)
        restartButton.isHidden = true
    }
    
    func settingsButtonAction(){
        router?.routeToSettings()
    }
    
    func playButtonAction(choise: Objects){
        let request = RPSModels.Game.Request(choise: choise)
        interactor?.playRPS(request: request)
    }
    
    func restart(){
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        botsChoise.isHidden = true
        winnerLabel.isHidden = true
        restartButton.isHidden = true
    }
}

extension RPSViewController: RPSDisplayLogic {
    
    func displayRPS(viewModel: RPSModels.Game.ViewModel) {
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        restartButton.isHidden = false
        botsChoise.isHidden = false
        winnerLabel.isHidden = false
        restartButton.isHidden = false
        winnerLabel.text = viewModel.gameResult
        botsChoise.text = viewModel.botsChoise
    }
}
