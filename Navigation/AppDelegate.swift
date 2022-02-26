//
//  AppDelegate.swift
//  Navigation
//
//  Created by Maksim Kargin on 12.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        let feed = FeedViewController()
        feed.view.backgroundColor = .systemGray2
        feed.title = "Feed"
        let feedNavigationController = UINavigationController(rootViewController: feed)
        feedNavigationController.navigationBar.standardAppearance = appearance
        feedNavigationController.navigationBar.scrollEdgeAppearance = feedNavigationController.navigationBar.standardAppearance
        
        let iconConfig = UIImage.SymbolConfiguration(scale: .large)
        let feedIcon = UIImage(systemName: "house.fill", withConfiguration: iconConfig)
        feedNavigationController.tabBarItem.image = feedIcon
        
        let profile = ProfileViewController()
        profile.view.backgroundColor = .lightGray
        profile.title = "Profile"
        let profileNavigationController = UINavigationController(rootViewController: profile)
        profileNavigationController.navigationBar.standardAppearance = appearance
        profileNavigationController.navigationBar.scrollEdgeAppearance = profileNavigationController.navigationBar.standardAppearance
        
        let profileIcon = UIImage(systemName: "person.fill", withConfiguration: iconConfig)
        profileNavigationController.tabBarItem.image = profileIcon
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.viewControllers = [feedNavigationController, profileNavigationController]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

