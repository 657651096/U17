//
//  AppDelegate.swift
//  U17Cartoon
//
//  Created by xiaoyao on 2022/8/17.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let homeVC = HomeViewController()
        let homeNaviVC = UINavigationController(rootViewController: homeVC)
        homeNaviVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tab_home")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tab_home_S")?.withRenderingMode(.alwaysOriginal))
        
        let classVC = ClassifyViewController()
        let classNaviVC = UINavigationController(rootViewController: classVC)
        classNaviVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tab_class")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tab_class_S")?.withRenderingMode(.alwaysOriginal))
        
        let bookshelfVC = BookshelfViewController()
        let bookshelfNaviVC = UINavigationController(rootViewController: bookshelfVC)
        bookshelfNaviVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tab_book")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tab_book_S")?.withRenderingMode(.alwaysOriginal))
        
        let mineVC = MineViewController()
        let mineNaviVC = UINavigationController(rootViewController: mineVC)
        mineNaviVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tab_mine")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tab_mine_S")?.withRenderingMode(.alwaysOriginal))

        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [homeNaviVC, classNaviVC, bookshelfNaviVC, mineNaviVC]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        
        return true
    }


}

