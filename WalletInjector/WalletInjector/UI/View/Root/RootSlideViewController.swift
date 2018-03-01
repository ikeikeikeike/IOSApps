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
        settings.style.buttonBarBackgroundColor = UIColor(red: 73/255, green: 72/255, blue: 62/255, alpha: 1)
        settings.style.buttonBarItemBackgroundColor = UIColor(red: 73/255, green: 72/255, blue: 62/255, alpha: 1)
        settings.style.buttonBarItemTitleColor = UIColor.white
        settings.style.selectedBarBackgroundColor = UIColor(red: 254/255, green: 0, blue: 124/255, alpha: 1)

        super.viewDidLoad()
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {

        let coincheckJPY = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CoincheckJPY")
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BitflyerJPY")
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ZaifJPY")
        let forthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Forth")
        let fifthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Fifth")
        let sixthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Sixth")
        let seventhVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Seventh")
        let eighthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Eighth")
        let ninethVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Nineth")
        let tenthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Tenth")

        return [
            coincheckJPY,
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
