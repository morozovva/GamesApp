//
//  RPSConfiguration.swift
//  GamesApp
//
//  Created by xyz mac on 14.04.2022.
//

import UIKit

struct RPSSetConfiguration: UIContentConfiguration {
    let pcChoise: String
    let personChoise: String
    let RPSResult: String
    
    func makeContentView() -> UIView & UIContentView {
        RPSSetContentView(with: self)
    }
    
    func updated(for state: UIConfigurationState) -> RPSSetConfiguration {
        self
    }
}

final class RPSSetContentView: UIView, UIContentView {
    var configuration: UIContentConfiguration
    
    private let pcLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let personLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let resLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    init(with contentConfiguration: RPSSetConfiguration) {
        self.configuration = contentConfiguration
        super.init(frame: .zero)
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
        layer.borderColor = .none
        layer.backgroundColor = UIColor.white.cgColor
        self.addSubview(personLabel)
        self.addSubview(pcLabel)
        self.addSubview(resLabel)
        makeConstraints()
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        guard let content = configuration as? RPSSetConfiguration else {
            return
        }
        self.personLabel.text = "Ваш выбор: \(content.personChoise)"
        self.pcLabel.text = "Выбор бота: \(content.pcChoise)"
        self.resLabel.text = "Результат игры: \(content.RPSResult)"
    }
    
    private func makeConstraints() {
        personLabel.translatesAutoresizingMaskIntoConstraints = false
        pcLabel.translatesAutoresizingMaskIntoConstraints = false
        resLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            personLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor,  constant: 10),
            personLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            personLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 5),
            pcLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 10),
            pcLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            pcLabel.topAnchor.constraint(equalTo: personLabel.bottomAnchor, constant: 5),
            resLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 10),
            resLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            resLabel.topAnchor.constraint(equalTo: pcLabel.bottomAnchor, constant: 5),
            resLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -5)
        ])
    }
}
