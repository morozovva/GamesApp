//
//  HeaderCollectionReusableView.swift
//  GamesApp
//
//  Created by xyz mac on 18.04.2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
            
    static let reuseIdentifier = "header"
    
    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.backgroundColor = .systemGroupedBackground
        headerLabel.textColor = .label
        headerLabel.font = .systemFont(ofSize: 20, weight: .semibold )
        headerLabel.textAlignment = .natural
        headerLabel.numberOfLines = 1
        return headerLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGroupedBackground
        addSubview(headerLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.frame = CGRect(x: 20, y: 5, width: 300, height: 20)
    }
    
    public func setTitle(title: String) {
        self.headerLabel.text = title
    }
}
