//
//  DiceViewController.swift
//  GamesApp
//
//  Created by xyz mac on 30.03.2022.
//

import UIKit

enum Numbers: Int, CaseIterable{
    case one, two, three, four, five, six
    
    func getEmoji() -> String {
        switch self {
        case .one:
            return "1️⃣"
        case .two:
            return "2️⃣"
        case .three:
            return "3️⃣"
        case .four:
            return "4️⃣"
        case .five:
            return "5️⃣"
        case .six:
            return "6️⃣"
        }
    }
}

protocol DiceDisplayLogic: AnyObject {
    func getTheDice(viewModel: DiceModels.States.ViewModel.Play)
    func revertDice(viewModel: DiceModels.States.ViewModel)
}

class DiceViewController: UIViewController {
    
    var interactor: DiceBusinessLogic?
    var router: DiceDataPassing?
    
    private func setup() {
        let viewController = self
        let interactor = DiceInteractor()
        let presenter = DicePresenter()
        let router = DiceRouter()
        let worker = DiceWorker()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        interactor.worker = worker
    }
    
    private var labels: [UILabel] = []
    
    private var oneDotLabel: UILabel = {
        let oneDotLabel = UILabel()
        oneDotLabel.text = "1️⃣"
        oneDotLabel.font = .systemFont(ofSize: 90, weight: .bold)
        return oneDotLabel
    }()
    
    private var twoDotLabel: UILabel = {
        let twoDotLabel = UILabel()
        twoDotLabel.text = "2️⃣"
        twoDotLabel.font = .systemFont(ofSize: 90, weight: .bold)
        return twoDotLabel
    }()
    
    private var threeDotLabel: UILabel = {
        let threeDotLabel = UILabel()
        threeDotLabel.text = "3️⃣"
        threeDotLabel.font = .systemFont(ofSize: 90, weight: .bold)
        return threeDotLabel
    }()
    
    private var fourDotLabel: UILabel = {
        let fourDotLabel = UILabel()
        fourDotLabel.text = "4️⃣"
        fourDotLabel.font = .systemFont(ofSize: 90, weight: .bold)
        return fourDotLabel
    }()
    
    private var fiveDotLabel: UILabel = {
        let fiveDotLabel = UILabel()
        fiveDotLabel.text = "5️⃣"
        fiveDotLabel.font = .systemFont(ofSize: 90, weight: .bold)
        return fiveDotLabel
    }()
    
    private var sixDotLabel: UILabel = {
        let sixDotLabel = UILabel()
        sixDotLabel.text = "6️⃣"
        sixDotLabel.font = .systemFont(ofSize: 90, weight: .bold)
        return sixDotLabel
    }()
    
    private lazy var playButton: UIButton = {
        let playButton = UIButton()
        playButton.setTitle("Бросить кубик", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        playButton.addAction(UIAction() { [weak self] _ in
            self?.diceButtonAction()
        }, for: .touchUpInside)
        playButton.layer.cornerRadius = 10.0
        playButton.layer.masksToBounds = true
        playButton.layer.borderWidth = 4.0
        playButton.layer.borderColor = UIColor.systemTeal.cgColor
        return playButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTitle()
        addConstraints()
        setup()
    }
}

private extension DiceViewController {
    
    private func addConstraints(){
        oneDotLabel.translatesAutoresizingMaskIntoConstraints = false
        twoDotLabel.translatesAutoresizingMaskIntoConstraints = false
        threeDotLabel.translatesAutoresizingMaskIntoConstraints = false
        fourDotLabel.translatesAutoresizingMaskIntoConstraints = false
        fiveDotLabel.translatesAutoresizingMaskIntoConstraints = false
        sixDotLabel.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            oneDotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -85),
            oneDotLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -125),
            oneDotLabel.widthAnchor.constraint(equalToConstant: 100),
            oneDotLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            
            twoDotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -85),
            twoDotLabel.widthAnchor.constraint(equalToConstant: 100),
            twoDotLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            twoDotLabel.topAnchor.constraint(equalTo: oneDotLabel.bottomAnchor),
            
            threeDotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -85),
            threeDotLabel.widthAnchor.constraint(equalToConstant: 100),
            threeDotLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            threeDotLabel.topAnchor.constraint(equalTo: twoDotLabel.bottomAnchor),
            
            fourDotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 85),
            fourDotLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -125),
            fourDotLabel.widthAnchor.constraint(equalToConstant: 100),
            fourDotLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            
            fiveDotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 85),
            fiveDotLabel.widthAnchor.constraint(equalToConstant: 100),
            fiveDotLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            fiveDotLabel.topAnchor.constraint(equalTo: fourDotLabel.bottomAnchor),
            
            sixDotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 85),
            sixDotLabel.widthAnchor.constraint(equalToConstant: 100),
            sixDotLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            sixDotLabel.topAnchor.constraint(equalTo: fiveDotLabel.bottomAnchor),
            
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 60),
            playButton.widthAnchor.constraint(equalToConstant: 250),
            playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 190)
        ])
    }

    func setupTitle() {
        title = "Игральная кость"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(oneDotLabel)
        view.addSubview(twoDotLabel)
        view.addSubview(threeDotLabel)
        view.addSubview(fourDotLabel)
        view.addSubview(fiveDotLabel)
        view.addSubview(sixDotLabel)
        view.addSubview(playButton)
        
        labels.append(oneDotLabel)
        labels.append(twoDotLabel)
        labels.append(threeDotLabel)
        labels.append(fourDotLabel)
        labels.append(fiveDotLabel)
        labels.append(sixDotLabel)
        
    }
    
    func diceButtonAction() {
        let request = DiceModels.States.Request(buttonState: playButton.isSelected)
        interactor?.playTheGame(request: request)
        playButton.isSelected = !playButton.isSelected
    }
}

extension DiceViewController: DiceDisplayLogic {
    func getTheDice(viewModel: DiceModels.States.ViewModel.Play) {
        playButton.setTitle(viewModel.buttonName, for: .normal)
        labels.forEach { $0.isHidden = true}
        labels[viewModel.shownLabel.rawValue].isHidden = false
        router?.sendDiceResult()
    }
    
    func revertDice(viewModel: DiceModels.States.ViewModel) {
        playButton.setTitle(viewModel.buttonName, for: .normal)
        labels.forEach { $0.isHidden = false}
    }
}
