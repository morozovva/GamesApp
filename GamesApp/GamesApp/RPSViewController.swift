//
//  RPSViewController.swift
//  GamesApp
//
//  Created by xyz mac on 30.03.2022.
//

import UIKit

class RPSViewController: UIViewController {
    
    private var dictionary: Translatable = russianGame()
    var tieState: Bool = true
    
    enum Objects: CaseIterable{
        case rock, paper, scissors
    }
    
    let rockImage = UIImage(named: "rock.png")!
    let paperImage = UIImage(named: "paper.png")!
    let scissorsImage = UIImage(named: "scissors.png")!
    
    private lazy var rockButton: UIButton = {
        let rockButton = UIButton()
        rockButton.translatesAutoresizingMaskIntoConstraints = false
        rockButton.setImage(rockImage, for: .normal)
        rockButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        rockButton.imageView?.tintColor = .red
        rockButton.addAction(UIAction() { [weak self] _ in
            self?.playTheGame(choise: .rock)
        }, for: .touchUpInside)
            
            return rockButton
        }()
    
    private lazy var paperButton: UIButton = {
        let paperButton = UIButton()
        paperButton.translatesAutoresizingMaskIntoConstraints = false
        paperButton.setImage(paperImage, for: .normal)
        paperButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        paperButton.addAction(UIAction() { [weak self] _ in
            self?.playTheGame(choise: .paper)
        }, for: .touchUpInside)
            
            return paperButton
        }()
    
    private lazy var scissorsButton: UIButton = {
        let scissorsButton = UIButton()
        scissorsButton.translatesAutoresizingMaskIntoConstraints = false
        scissorsButton.setImage(scissorsImage, for: .normal)
        scissorsButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        scissorsButton.addAction(UIAction() { [weak self] _ in
            self?.playTheGame(choise: .scissors)
        }, for: .touchUpInside)
            
            return scissorsButton
        }()
    
    private var winnerLabel: UILabel = {
        let winnerLabel = UILabel()
        winnerLabel.translatesAutoresizingMaskIntoConstraints = false
        winnerLabel.font = .systemFont(ofSize: 30, weight: .bold)
        return winnerLabel
    }()
    
    private var botsChoise: UILabel = {
        let botsChoise = UILabel()
        botsChoise.translatesAutoresizingMaskIntoConstraints = false
        botsChoise.font = .systemFont(ofSize: 100, weight: .bold)
        return botsChoise
    }()
    
    private lazy var restartButton: UIButton = {
        let restartButton = UIButton()
        restartButton.backgroundColor = .white
        restartButton.frame.size.width = 500
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.setTitle("Начать заново", for: .normal)
        restartButton.setTitleColor(.black, for: .normal)
        restartButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        restartButton.addAction(UIAction() { [weak self] _ in
            self?.restart()
        }, for: .touchUpInside)
        restartButton.layer.cornerRadius = 10.0
        restartButton.clipsToBounds = true
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
            botsChoise.topAnchor.constraint(equalTo: paperButton.bottomAnchor),
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
        rockButton.isEnabled = true
        paperButton.isEnabled = true
        scissorsButton.isEnabled = true
        botsChoise.isHidden = true
        winnerLabel.isHidden = true
        restartButton.isHidden = true
    }
    
    func playTheGame(choise: Objects){
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        restartButton.isEnabled = true
        botsChoise.isHidden = false
        winnerLabel.isHidden = false
        restartButton.isHidden = false
        winnerLabel.text = RPCGame(choise: choise, tiestate: tieState)
    }
    
    func RPCGame(choise: Objects, tiestate: Bool) -> String{
        let botChoise: Objects
        if tieState == false {
            botChoise = Objects.allCases.randomElement()!
        }
        else {
            switch choise {
            case .rock:
                let arr = [Objects.paper, Objects.scissors]
                botChoise = arr.randomElement()!
            case .paper:
                let arr = [Objects.rock, Objects.scissors]
                botChoise = arr.randomElement()!
            case .scissors:
                let arr = [Objects.paper, Objects.rock]
                botChoise = arr.randomElement()!
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
        switch choise {
        case .rock:
            switch botChoise {
            case .rock:
                return dictionary.getText(0)
            case .paper:
                return dictionary.getText(1)
            case .scissors:
                return dictionary.getText(2)
            }
        case .paper:
            switch botChoise {
            case .rock:
                return dictionary.getText(2)
            case .paper:
                return dictionary.getText(0)
            case .scissors:
                return dictionary.getText(1)
            }
        case .scissors:
            switch botChoise {
            case .rock:
                return dictionary.getText(1)
            case .paper:
                return dictionary.getText(2)
            case .scissors:
                return dictionary.getText(0)
            }
        }
    }
    
    func openSettings() {
        let vc = SettingsViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

