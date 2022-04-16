//
//  SettingsViewController.swift
//  GamesApp
//
//  Created by xyz mac on 31.03.2022.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func languageButtonDidTap (_ state: Bool)
    func tieButtonDidTap(_ state: Bool)
}

class SettingsViewController: UIViewController{
    
    let defaults = UserDefaults.standard
    weak var delegate: SettingsViewControllerDelegate?
    
    private let changeLangLabel: UILabel = {
        let changeLangLabel = UILabel()
        changeLangLabel.text = "Установить английский язык"
        changeLangLabel.font = .systemFont(ofSize: 21, weight: .regular)
        changeLangLabel.lineBreakMode = .byWordWrapping
        changeLangLabel.numberOfLines = 0
        return changeLangLabel
    }()
    
    private lazy var langSwitchButton: UIButton = {
        let langSwitchButton = UIButton()
        langSwitchButton.backgroundColor = .white
        langSwitchButton.setImage(
                    UIImage(
                        systemName: (defaults.bool(forKey: "langState") == true) ? "checkmark.circle" : "checkmark.circle.fill",
                        withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)),
                    for: .normal)
        langSwitchButton.tintColor = .black
        langSwitchButton.addAction(UIAction() { [weak self] _ in
            self?.didPressLangButton()
        }, for: .touchUpInside)
        return langSwitchButton
    }()
    
    private var enableTieLabel: UILabel = {
        let enableTieLabel = UILabel()
        enableTieLabel.text = "Включить режим возможной ничьи"
        enableTieLabel.font = .systemFont(ofSize: 21, weight: .regular)
        enableTieLabel.lineBreakMode = .byWordWrapping
        enableTieLabel.numberOfLines = 0
        return enableTieLabel
    }()
    
    private lazy var tieSwitchButton: UIButton = {
        let tieSwitchButton = UIButton()
        tieSwitchButton.backgroundColor = .white
        tieSwitchButton.setImage(
                    UIImage(
                        systemName: (defaults.bool(forKey: "tieState") == true) ? "checkmark.circle" : "checkmark.circle.fill",
                        withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)),
                    for: .normal)
        tieSwitchButton.tintColor = .black
        tieSwitchButton.addAction(UIAction() { [weak self] _ in
            self?.didPressTieButton()
        }, for: .touchUpInside)
        return tieSwitchButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTitle()
        addConstraints()
    }
}

private extension SettingsViewController {
    
    func setupTitle() {
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(changeLangLabel)
        view.addSubview(enableTieLabel)
        view.addSubview(langSwitchButton)
        view.addSubview(tieSwitchButton)
    }
    
    private func addConstraints(){
        changeLangLabel.translatesAutoresizingMaskIntoConstraints = false
        enableTieLabel.translatesAutoresizingMaskIntoConstraints = false
        langSwitchButton.translatesAutoresizingMaskIntoConstraints = false
        tieSwitchButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            changeLangLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -70),
            changeLangLabel.heightAnchor.constraint(equalToConstant: 80),
            changeLangLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            changeLangLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            changeLangLabel.heightAnchor.constraint(equalToConstant: 60),
            
            enableTieLabel.widthAnchor.constraint(equalToConstant: 310),
            enableTieLabel.heightAnchor.constraint(equalToConstant: 80),
            enableTieLabel.topAnchor.constraint(equalTo: changeLangLabel.bottomAnchor),
            enableTieLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            
            langSwitchButton.centerYAnchor.constraint(equalTo: changeLangLabel.centerYAnchor),
            langSwitchButton.leftAnchor.constraint(equalTo: changeLangLabel.rightAnchor, constant: 10),
            langSwitchButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            langSwitchButton.widthAnchor.constraint(equalToConstant: 60),
            
            tieSwitchButton.centerYAnchor.constraint(equalTo: enableTieLabel.centerYAnchor),
            tieSwitchButton.leftAnchor.constraint(equalTo: changeLangLabel.rightAnchor, constant: 10),
            tieSwitchButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            tieSwitchButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func changeLangState(state: Bool){
        defaults.set(!state, forKey: "langState")
    }
    func changeTieState(tie: Bool){
        defaults.set(!tie, forKey: "tieState")
    }
    
    func didPressLangButton(){
        changeLangState(state: defaults.bool(forKey: "langState"))
        delegate?.languageButtonDidTap(defaults.bool(forKey: "langState"))
        langSwitchButton.setImage(
                    UIImage(
                        systemName: (defaults.bool(forKey: "langState") == true) ? "checkmark.circle" : "checkmark.circle.fill",
                        withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)),
                    for: .normal)
    }
    
    func didPressTieButton() {
        changeTieState(tie: defaults.bool(forKey: "tieState"))
        delegate?.tieButtonDidTap(defaults.bool(forKey: "tieState"))
        tieSwitchButton.setImage(
            UIImage(
                systemName: (defaults.bool(forKey: "tieState") == true) ? "checkmark.circle" : "checkmark.circle.fill",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)),
            for: .normal)
    }
}
