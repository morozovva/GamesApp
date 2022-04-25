//
//  RocketViewController.swift
//  GamesApp
//
//  Created by xyz mac on 21.04.2022.
//

import UIKit

class RocketViewController: UIViewController {
    
    private let rocketView = RocketView()
    
    override func loadView() {
        view = rocketView
        view.backgroundColor = .white
        }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

