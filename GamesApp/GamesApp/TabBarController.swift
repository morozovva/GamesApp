//
//  TabBarController.swift
//  GamesApp
//
//  Created by xyz mac on 30.03.2022.
//

import UIKit

class TabBarController: UITabBarController {

    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isOpaque = true
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .white
        tabBar.backgroundColor = .systemTeal
        setupTabBar()
    }
}

private extension TabBarController {
    
    func setupTabBar() {
        let navCRPS = NavigationController(
            rootViewController: RPSViewController()
        )
        let navCDice = NavigationController(
            rootViewController: GameViewController()
        )
        
        let configuration = UIImage.SymbolConfiguration(
            pointSize: 20, weight: .semibold
        )
        navCRPS.tabBarItem = UITabBarItem(
            title: "Камень Ножницы Бумага",
            image: UIImage(systemName: "hand.wave"),
            tag: 1
        )
        navCRPS.tabBarItem.selectedImage = UIImage(systemName: "hand.wave.fill", withConfiguration: configuration)
        
        navCDice.tabBarItem = UITabBarItem(
            title: "Игральная кость",
            image: UIImage(systemName: "cube"),
            tag: 1)
        navCDice.tabBarItem.selectedImage = UIImage(systemName: "cube.fill", withConfiguration: configuration)
        
        setViewControllers([navCRPS, navCDice], animated: false)
    }
}
