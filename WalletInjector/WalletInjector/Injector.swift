//
//  Injector.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/18.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Foundation
import Swinject

final class Injector {
    static let container = Container()
    
    class func initialize() {
//        container.register(BubbleInteractor.self) { _ in BubbleInteractorImpl() }
    }
}
