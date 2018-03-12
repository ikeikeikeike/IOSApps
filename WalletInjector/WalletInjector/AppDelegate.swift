//
//  AppDelegate.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/11.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit
import Compass

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions opts: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        setupRouting()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

}

extension AppDelegate {
    func setupRouting() {
        Navigator.scheme = "compass"
        Navigator.routes = ["chart", "settings", "login", "logout"]
        Navigator.handle = { [weak self] location in
            guard let `self` = self else {
                return
            }

            let arguments = location.arguments
            print(arguments)
//            let rootController = self.window?.rootViewController as? UITabBarController
//            RootTabBarController

            switch location.path {
            case "chart":
                let vc = Storyboard.main.instantiate(ChartViewController.self)
                rootController?.pushViewController(vc, animated: true)
            case "settings":
                let vc = Storyboard.main.instantiate(SettingsViewController.self)
                rootController?.pushViewController(vc, animated: true)
            case "login":
                let vc = Storyboard.main.instantiate(LoginViewController.self)
                rootController?.pushViewController(vc, animated: true)
            case "logout":
                break
            default:
                break
            }
        }
    }
}
