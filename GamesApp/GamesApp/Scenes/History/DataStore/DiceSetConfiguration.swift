//
//  DiceSetConfiguration.swift
//  GamesApp
//
//  Created by xyz mac on 15.04.2022.
//

import UIKit

struct DiceSetConfiguration: UIContentConfiguration {
    let diceResult: String
    
    func makeContentView() -> UIView & UIContentView {
        DiceSetContentView(with: self)
    }
    
    func updated(for state: UIConfigurationState) -> DiceSetConfiguration {
        self
    }
}

final class DiceSetContentView: UIView, UIContentView {
    var configuration: UIContentConfiguration
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    init(with contentConfiguration: DiceSetConfiguration) {
        self.configuration = contentConfiguration
        super.init(frame: .zero)
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
        layer.borderColor = .none
        label.textAlignment = .left
        layer.backgroundColor = UIColor.white.cgColor
        self.addSubview(label)
        makeConstraints()
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        guard let content = configuration as? DiceSetConfiguration else {
            return
        }
        self.label.text = content.diceResult
    }
    
    private func makeConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            label.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            label.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
    }
}
