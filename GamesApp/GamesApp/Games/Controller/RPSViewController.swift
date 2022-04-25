//
//  RPSViewController.swift
//  GamesApp
//
//  Created by xyz mac on 30.03.2022.
//

import UIKit

protocol RPSViewControllerDelegate: AnyObject {
    func getRPSData(personRes: String, pcRes: String, RPSRes: String)
    func getBestSet(number: Int)
}

class RPSViewController: UIViewController {
    
    private var bestSetCounter: Int = 0
    private var bestSetSaver: Int = 0

    weak var RPSDelegate: RPSViewControllerDelegate?
    
    private var dictionary: Translatable = russianGame()
    private var tieState: Bool = true
    
    enum Objects: String, CaseIterable{
        case rock = "✊🏻"
        case paper = "✋🏻"
        case scissors = "✌🏻"
    }
    
    let rockImage = UIImage(named: "rock.png")
    let paperImage = UIImage(named: "paper.png")
    let scissorsImage = UIImage(named: "scissors.png")
    
    private lazy var rockButton: UIButton = {
        let rockButton = UIButton()
        rockButton.setImage(rockImage, for: .normal)
        rockButton.addAction(UIAction() { [weak self] _ in
            self?.playTheGame(choise: .rock)
        }, for: .touchUpInside)
            return rockButton
        }()
    
    private lazy var paperButton: UIButton = {
        let paperButton = UIButton()
        paperButton.setImage(paperImage, for: .normal)
        paperButton.addAction(UIAction() { [weak self] _ in
            self?.playTheGame(choise: .paper)
        }, for: .touchUpInside)
            return paperButton
        }()
    
    private lazy var scissorsButton: UIButton = {
        let scissorsButton = UIButton()
        scissorsButton.setImage(scissorsImage, for: .normal)
        scissorsButton.addAction(UIAction() { [weak self] _ in
            self?.playTheGame(choise: .scissors)
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
        restartButton.setTitle("Начать заново", for: .normal)
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
        setupNavigationBarIfPossible()
        setupView()
        addConstraints()
    }
}

extension RPSViewController: SettingsViewControllerDelegate {
    func languageButtonDidTap(_ state: Bool) {
        switch state{
        case true:
            dictionary = russianGame()
        case false:
            dictionary = englishGame()
        }
    }
    
    func tieButtonDidTap(_ state: Bool){
        switch state{
        case true:
            tieState = true
        case false:
            tieState = false
        }
    }
}

private extension RPSViewController {
    
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
        title = "Камень Ножницы Бумага"
        navigationController?.navigationBar.prefersLargeTitles = true
        let settingsButton = UIButton()
        settingsButton.setImage(
            UIImage(systemName: "gearshape",
                    withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)),
            for: .normal)
        settingsButton.imageView?.tintColor = .black
        settingsButton.addAction(UIAction() { [weak self] _ in
            self?.openSettings()
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
    
    func restart(){
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        botsChoise.isHidden = true
        winnerLabel.isHidden = true
        restartButton.isHidden = true
    }
    
    func playTheGame(choise: Objects){
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        restartButton.isHidden = false
        botsChoise.isHidden = false
        winnerLabel.isHidden = false
        restartButton.isHidden = false
        winnerLabel.text = RPCGame(choise: choise, tiestate: tieState)
    }
    
    func RPCGame(choise: Objects, tiestate: Bool) -> String{
        var botChoise: Objects = .rock
        if !tieState {
            if let temp = Objects.allCases.randomElement() {
                botChoise = temp
            }
        }
        else {
            while botChoise == choise {
                if let temp = Objects.allCases.randomElement() {
                    botChoise = temp
                }
            }
        }
        switch botChoise{
        case .rock:
            botsChoise.text = "✊🏻"
        case .paper:
            botsChoise.text = "✋🏻"
        case .scissors:
            botsChoise.text = "✌🏻"
        }
        let gameTuple = (player: choise, bot: botChoise)
        let RPSRes: String
        switch gameTuple{
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            RPSRes = dictionary.getText(0)
            bestSetCounter = 0
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            bestSetCounter+=1
            if bestSetCounter>bestSetSaver{
                bestSetSaver = bestSetCounter
            }
            RPSRes = dictionary.getText(2)
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            bestSetCounter = 0
            RPSRes = dictionary.getText(1)
        }
        RPSDelegate?.getRPSData(personRes: choise.rawValue, pcRes: botsChoise.text!, RPSRes: RPSRes)
        RPSDelegate?.getBestSet(number: bestSetSaver)
        return RPSRes
    }
    
    func openSettings() {
        let vc = SettingsViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
