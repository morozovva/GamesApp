//
//  SettingsViewController.swift
//  GamesApp
//
//  Created by xyz mac on 31.03.2022.
//

import UIKit


protocol SettingsDisplayLogic: AnyObject
{
    func displaySettings(viewModel: SettingsModels.Settings.ViewModel)
}

class SettingsViewController: UIViewController{
    
    var interactor: SettingsBusinessLogic?
    
    private func setup()
    {
      let viewController = self
      let interactor = SettingsInteractor()
      let presenter = SettingsPresenter()
        viewController.interactor = interactor
      interactor.presenter = presenter
      presenter.viewController = viewController
    }
    
    private let changeLangLabel: UILabel = {
        let changeLangLabel = UILabel()
        changeLangLabel.text = L10n.Settings.english
        changeLangLabel.font = .systemFont(ofSize: 21, weight: .regular)
        changeLangLabel.lineBreakMode = .byWordWrapping
        changeLangLabel.numberOfLines = 0
        return changeLangLabel
    }()
    
    private lazy var langSwitchButton: UIButton = {
        let langSwitchButton = UIButton()
        langSwitchButton.backgroundColor = .white
        langSwitchButton.tintColor = .black
        langSwitchButton.addAction(UIAction() { [weak self] _ in
            self?.didPressLangButton()
        }, for: .touchUpInside)
        return langSwitchButton
    }()
    
    private var enableTieLabel: UILabel = {
        let enableTieLabel = UILabel()
        enableTieLabel.text = L10n.Settings.tieMode
        enableTieLabel.font = .systemFont(ofSize: 21, weight: .regular)
        enableTieLabel.lineBreakMode = .byWordWrapping
        enableTieLabel.numberOfLines = 0
        return enableTieLabel
    }()
    
    private lazy var tieSwitchButton: UIButton = {
        let tieSwitchButton = UIButton()
        tieSwitchButton.backgroundColor = .white
        tieSwitchButton.tintColor = .black
        tieSwitchButton.addAction(UIAction() { [weak self] _ in
            self?.didPressTieButton()
        }, for: .touchUpInside)
        return tieSwitchButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupView()
        setupTitle()
        addConstraints()
        setupButtons()
    }
}

private extension SettingsViewController {
    
    func setupTitle() {
        title = L10n.Navigation.settings
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
    
    func setupButtons(){
        let request = SettingsModels.Settings.Request()
        interactor?.showSettings(request: request)
    }
    
    func didPressLangButton(){
        let request = SettingsModels.Settings.Request()
        interactor?.changeLanguage(request: request)
    }
    
    func didPressTieButton() {
        let request = SettingsModels.Settings.Request()
        interactor?.changeTieMode(request: request)
    }
}

extension SettingsViewController: SettingsDisplayLogic {
    func displaySettings(viewModel: SettingsModels.Settings.ViewModel) {
        tieSwitchButton.setImage(
            UIImage(
                systemName: (viewModel.tieCheck == true) ? "checkmark.circle" : "checkmark.circle.fill",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)),
            for: .normal)
        langSwitchButton.setImage(
                    UIImage(
                        systemName: (viewModel.langCheck == true) ? "checkmark.circle" : "checkmark.circle.fill",
                        withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)),
                    for: .normal)
    }
}
