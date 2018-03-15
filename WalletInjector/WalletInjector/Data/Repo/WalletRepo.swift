//
//  WalletRepo.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/16.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import Moya
import RxMoya
import RxSwift

public protocol WalletRepo {
    func signin(email: String, password: String, handler: @escaping (SingleEvent<SignioEntity>) -> Void)
    func signup(email: String, password: String, handler: @escaping (SingleEvent<SignioEntity>) -> Void)
}

public struct WalletRepoImpl: WalletRepo {
    public static let shared: WalletRepo = WalletRepoImpl()
    fileprivate let store: WalletStore! = Injector.ct.resolve(WalletStore.self)

    public func signin(email: String, password: String, handler: @escaping (SingleEvent<SignioEntity>) -> Void) {
        store.signin(email: email, password: password, handler: handler)
    }

    public func signup(email: String, password: String, handler: @escaping (SingleEvent<SignioEntity>) -> Void) {
        store.signup(email: email, password: password, handler: handler)
    }
}
