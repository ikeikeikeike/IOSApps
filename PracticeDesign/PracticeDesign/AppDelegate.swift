//
//  AppDelegate.swift
//  PracticeDesign
//
//  Created by Tatsuo Ikeda on 2018/03/18.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        
        Routes.initialize()
        
        if let initialTab = self.window!.rootViewController as? UITabBarController {
            initialTab.selectedIndex = 0
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }


}

