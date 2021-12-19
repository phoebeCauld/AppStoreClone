//
//  TabBarController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 28.11.2021.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            createNavController(viewController: TodayController(), title: "Today", image: "today_icon"),
            createNavController(viewController: AppsCollectionViewController(), title: "Apps", image: "apps"),
            createNavController(viewController: SearchCollectionViewController(), title: "Search", image: "search")
        ]
    }

    fileprivate func createNavController(viewController: UIViewController, title: String, image: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: image)
        return navController
    }
}
