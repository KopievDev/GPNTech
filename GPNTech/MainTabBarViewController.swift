//
//  MainTabBarViewController.swift
//  GPNTech
//
//  Created by Ivan Kopiev on 26.06.2021.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .fullScreen
        
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = nil
        
        delegate = self
        

//        let targetVC = TargetViewController()
//        let ratingVC = RatingViewController()
//        let chatsVC = ChatsViewController()
        let catalogVC = WellViewController()
//        let profileVC = ProfileViewController()
//
        let catalogNavigation = UINavigationController(rootViewController: catalogVC)
//        let chatNavigation = UINavigationController(rootViewController: chatsVC)

        UINavigationBar.appearance().tintColor = .black
        
        viewControllers = [catalogNavigation]
        selectedIndex = 0
        tabBar.tintColor = UIColor(red: 0.278, green: 0.596, blue: 0.8, alpha: 1)
        tabBar.unselectedItemTintColor =         UIColor(red: 0.764, green: 0.854, blue: 0.917, alpha: 1)
        
        tabBar.barTintColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tabBar.isTranslucent = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
