//
//  Storyboard.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/13.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit
import Compass

public enum Storyboard: String {
    case main = "Main"
    case settings = "Settings"
    case chart = "Chart"
    case login = "Login"

    public func instantiate<VC: UIViewController>(_ viewController: VC.Type,
                                                  inBundle bundle: Bundle = .main) -> VC {
        guard
            let vc = UIStoryboard(name: self.rawValue, bundle: Bundle(identifier: bundle.bundleIdentifier!))
                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
            else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }

        return vc
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
            print(location.path)
            print("------")
//            let rootController = self.window?.rootViewController as? RootTabBarController
            //            RootTabBarController

            switch location.path {
            case "chart":
                let vc = Storyboard.main.instantiate(ChartViewController.self)
                self.window?.rootViewController?.present(vc, animated: true, completion: nil)
            case "settings":
                let tc = Storyboard.main.instantiate(RootTabBarController.self)
                self.window?.rootViewController?.show(tc, sender: nil)
            case "login":
                let vc = Storyboard.main.instantiate(LoginViewController.self)
                self.window?.rootViewController?.present(vc, animated: true, completion: nil)
            case "logout":
                print("logout")
            default:
                break
            }
        }
    }
}
