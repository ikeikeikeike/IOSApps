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
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CoincheckJPY"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BitflyerJPY"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ZaifJPY"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Forth"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Fifth"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Sixth"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Seventh"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Eighth"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Nineth"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Tenth")
        ]
    }
}
