//
//  Storyboard.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/13.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import Foundation
import UIKit

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
