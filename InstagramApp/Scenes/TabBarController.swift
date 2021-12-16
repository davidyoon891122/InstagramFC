//
//  TabBarController.swift
//  InstagramApp
//
//  Created by David Yoon on 2021/12/16.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        
        feedViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        profileViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        
        self.viewControllers = [ feedViewController, profileViewController]
        
    }
}


