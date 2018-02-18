//
//  SwinjectStoryboard+WalletInjector.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/18.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        Injector.initialize()

        _ = SwinjectStoryboard.defaultContainer

    }
}
