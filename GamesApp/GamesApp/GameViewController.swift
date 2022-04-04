//
//  GameViewController.swift
//  GamesApp
//
//  Created by xyz mac on 30.03.2022.
//

import UIKit

enum Numbers: CaseIterable{
    case one, two, three, four, five, six
}

class GameViewController: UIViewController {
    
    var labels: [UILabel] = []
    
    private var oneDotLabel: UILabel = {
        let oneDotLabel = UILabel()
        oneDotLabel.translatesAutoresizingMaskIntoConstraints = false
        oneDotLabel.text = "1️⃣"
        oneDotLabel.font = .systemFont(ofSize: 100, weight: .bold)
        return oneDotLabel
    }()
    
    private var twoDotLabel: UILabel = {
        let twoDotLabel = UILabel()
        twoDotLabel.translatesAutoresizingMaskIntoConstraints = false
        twoDotLabel.text = "2️⃣"
        twoDotLabel.font = .systemFont(ofSize: 100, weight: .bold)
        
        return twoDotLabel
    }()
    private var threeDotLabel: UILabel = {
        let threeDotLabel = UILabel()
        threeDotLabel.translatesAutoresizingMaskIntoConstraints = false
        threeDotLabel.text = "3️⃣"
        threeDotLabel.font = .systemFont(ofSize: 100, weight: .bold)
        
        return threeDotLabel
    }()
    private var fourDotLabel: UILabel = {
        let fourDotLabel = UILabel()
        fourDotLabel.translatesAutoresizingMaskIntoConstraints = false
        fourDotLabel.text = "4️⃣"
        fourDotLabel.font = .systemFont(ofSize: 100, weight: .bold)
        
        return fourDotLabel
    }()
    private var fiveDotLabel: UILabel = {
        let fiveDotLabel = UILabel()
        fiveDotLabel.translatesAutoresizingMaskIntoConstraints = false
        fiveDotLabel.text = "5️⃣"
        fiveDotLabel.font = .systemFont(ofSize: 100, weight: .bold)
        
        return fiveDotLabel
    }()
    
    private var sixDotLabel: UILabel = {
        let sixDotLabel = UILabel()
        sixDotLabel.translatesAutoresizingMaskIntoConstraints = false
        sixDotLabel.text = "6️⃣"
        sixDotLabel.font = .systemFont(ofSize: 100, weight: .bold)
        
        return sixDotLabel
    }()
    
    private lazy var playButton: UIButton = {
        let playButton = UIButton()
        playButton.translatesAutoresizingMaskIntoConstraints = false
    
        playButton.frame.size.width = 500
        playButton.setTitle("Бросить кубик", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        playButton.addAction(UIAction() { [weak self] _ in
            self?.GameButton()
        }, for: .touchUpInside)
        playButton.layer.cornerRadius = 10.0
        playButton.clipsToBounds = true
        playButton.layer.borderWidth = 4.0
        playButton.layer.borderColor = UIColor.systemTeal.cgColor
        
        return playButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTitle()
        addConstraints()
    }

}

private extension GameViewController {
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            oneDotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -85),
            oneDotLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -175),
            oneDotLabel.widthAnchor.constraint(equalToConstant: 110),
            oneDotLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            
            twoDotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -85),
            twoDotLabel.widthAnchor.constraint(equalToConstant: 110),
            twoDotLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            twoDotLabel.topAnchor.constraint(equalTo: oneDotLabel.bottomAnchor),
            
            threeDotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -85),
            threeDotLabel.widthAnchor.constraint(equalToConstant: 110),
            threeDotLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            threeDotLabel.topAnchor.constraint(equalTo: twoDotLabel.bottomAnchor),
            
            fourDotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 85),
            fourDotLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -175),
            fourDotLabel.widthAnchor.constraint(equalToConstant: 110),
            fourDotLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            
            fiveDotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 85),
            fiveDotLabel.widthAnchor.constraint(equalToConstant: 110),
            fiveDotLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            fiveDotLabel.topAnchor.constraint(equalTo: fourDotLabel.bottomAnchor),
            
            sixDotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 85),
            sixDotLabel.widthAnchor.constraint(equalToConstant: 110),
            sixDotLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            sixDotLabel.topAnchor.constraint(equalTo: fiveDotLabel.bottomAnchor),
            
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 60),
            playButton.widthAnchor.constraint(equalToConstant: 250),
            playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 230)
        ])
    }
    
//    let labels = [
//        oneDotLabel,
//        twoDotLabel,
//        threeDotLabel,
//        fourDotLabel,
//        fiveDotLabel,
//        sixDotLabel
//    ]
    
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
    
    func GameButton(){
        if playButton.currentTitle == "Бросить кубик"{
            rollTheDice()
        }
        else {
            renewGame()
        }
    }
    
    func rollTheDice(){
        let chosenLabel = labels.randomElement()
        labels.forEach { $0.isHidden = true }
        chosenLabel?.isHidden = false
        playButton.setTitle("Повтор", for: .normal)
        
//        let result = Numbers.allCases.randomElement()
//        switch result{
//        case .one:
//            oneDotLabel.isHidden = false
//        case .two:
//            twoDotLabel.isHidden = false
//        case .three:
//            threeDotLabel.isHidden = false
//        case .four:
//            fourDotLabel.isHidden = false
//        case .five:
//            fiveDotLabel.isHidden = false
//        case .six:
//            sixDotLabel.isHidden = false
//        case .none:
//            break
//        }
    }
    
    func renewGame(){
        labels.forEach { $0.isHidden = false }
//        oneDotLabel.isHidden = false
//        twoDotLabel.isHidden = false
//        threeDotLabel.isHidden = false
//        fourDotLabel.isHidden = false
//        fiveDotLabel.isHidden = false
//        sixDotLabel.isHidden = false
        playButton.setTitle("Бросить кубик", for: .normal)
    }
    
}
