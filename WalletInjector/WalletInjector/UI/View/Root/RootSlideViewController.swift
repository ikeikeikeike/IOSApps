//
//  RootSlideViewController.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/01.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class RootSlideViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {

        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "First")
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Second")
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Third")
        let forthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Forth")
        let fifthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Fifth")
        let sixthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Sixth")
        let seventhVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Seventh")
        let eighthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Eighth")
        let ninethVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Nineth")
        let tenthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Tenth")

        return [
            firstVC,
            secondVC,
            thirdVC,
            forthVC,
            fifthVC,
            sixthVC,
            seventhVC,
            eighthVC,
            ninethVC,
            tenthVC
        ]
    }
}
