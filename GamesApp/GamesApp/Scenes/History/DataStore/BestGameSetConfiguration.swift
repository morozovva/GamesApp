//
//  BestGameSetConfiguration.swift
//  GamesApp
//
//  Created by xyz mac on 14.04.2022.
//

import UIKit

struct BestGameSetConfiguration: UIContentConfiguration {

    let id: Int
    var bestRPSSet: Int
    var oneStats: Double
    var twoStats: Double
    var threeStats: Double
    var fourStats: Double
    var fiveStats: Double
    var sixStats: Double

    init(id: Int, bestRPSSet: Int, one: Double, two: Double, three: Double, four: Double, five: Double, six: Double){
        self.id = id
        self.oneStats = one
        self.twoStats = two
        self.threeStats = three
        self.fourStats = four
        self.fiveStats = five
        self.sixStats = six
        self.bestRPSSet = bestRPSSet
    }

    func makeContentView() -> UIView & UIContentView {
        BestGameSetContentView(with: self)
    }

    func updated(for state: UIConfigurationState) -> BestGameSetConfiguration {
        self
    }
}

final class BestGameSetContentView: UIView, UIContentView {
    var configuration: UIContentConfiguration

    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let BestSetLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let oneLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let twoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let threeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let fourLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let fiveLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let sixLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    init(with contentConfiguration: BestGameSetConfiguration) {
        configuration = contentConfiguration
        super.init(frame: .zero)
        layer.borderWidth = 4.0
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
        layer.borderColor = UIColor.systemTeal.cgColor
        addSubview(label)
        addSubview(BestSetLabel)
        addSubview(oneLabel)
        addSubview(twoLabel)
        addSubview(threeLabel)
        addSubview(fourLabel)
        addSubview(fiveLabel)
        addSubview(sixLabel)
        makeConstraints()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        guard let content = configuration as? BestGameSetConfiguration else {
            return
        }
        
        switch content.id{
        case 0:
            label.text = L10n.History.RPSBestSet.title
            BestSetLabel.text = "\(content.bestRPSSet) \(L10n.History.RPSBestSet.subTitle)"
            oneLabel.isHidden = true
            twoLabel.isHidden = true
            threeLabel.isHidden = true
            fourLabel.isHidden = true
            fiveLabel.isHidden = true
            sixLabel.isHidden = true
        case 1:
            label.text = L10n.History.DiceStats.title
            oneLabel.text = "1️⃣: \(String(format:"%.3f", content.oneStats))"
            twoLabel.text = "2️⃣: \(String(format:"%.3f", content.twoStats))"
            threeLabel.text = "3️⃣: \(String(format:"%.3f", content.threeStats))"
            fourLabel.text = "4️⃣: \(String(format:"%.3f", content.fourStats))"
            fiveLabel.text = "5️⃣: \(String(format:"%.3f", content.fiveStats))"
            sixLabel.text = "6️⃣: \(String(format:"%.3f", content.sixStats))"
            BestSetLabel.isHidden = true
        default:
            break
        }
    }

    private func makeConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        BestSetLabel.translatesAutoresizingMaskIntoConstraints = false
        oneLabel.translatesAutoresizingMaskIntoConstraints = false
        twoLabel.translatesAutoresizingMaskIntoConstraints = false
        threeLabel.translatesAutoresizingMaskIntoConstraints = false
        fourLabel.translatesAutoresizingMaskIntoConstraints = false
        fiveLabel.translatesAutoresizingMaskIntoConstraints = false
        sixLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            BestSetLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            BestSetLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            BestSetLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            
            oneLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 70),
            oneLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),

            twoLabel.leftAnchor.constraint(equalTo: oneLabel.leftAnchor),
            twoLabel.topAnchor.constraint(equalTo: oneLabel.bottomAnchor, constant: 20),

            threeLabel.leftAnchor.constraint(equalTo: oneLabel.leftAnchor),
            threeLabel.topAnchor.constraint(equalTo: twoLabel.bottomAnchor, constant: 20),

            fourLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -70),
            fourLabel.topAnchor.constraint(equalTo: oneLabel.topAnchor),

            fiveLabel.leftAnchor.constraint(equalTo: fourLabel.leftAnchor),
            fiveLabel.topAnchor.constraint(equalTo: twoLabel.topAnchor),

            sixLabel.leftAnchor.constraint(equalTo: fourLabel.leftAnchor),
            sixLabel.topAnchor.constraint(equalTo: threeLabel.topAnchor)
        ])
    }
}

