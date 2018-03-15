//
//  WalletStore.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/16.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import Moya
import RxMoya
import RxSwift

protocol WalletStore {
    func signin(email: String, password: String, handler: @escaping (SingleEvent<SignioEntity>) -> Void)
    func signup(email: String, password: String, handler: @escaping (SingleEvent<SignioEntity>) -> Void)
}

struct WalletStoreImpl: WalletStore {
    fileprivate let provider: WalletProvider! = Injector.ct.resolve(WalletProvider.self)

    public func signin(email: String, password: String, handler: @escaping (SingleEvent<SignioEntity>) -> Void) {
        _ = provider.api.rx.request(.signin(email: email, password: password))
            .filterSuccessfulStatusCodes()
            .map(SignioEntity.self)
            .subscribe(handler)
    }

    public func signup(email: String, password: String, handler: @escaping (SingleEvent<SignioEntity>) -> Void) {
        _ = provider.api.rx.request(.signin(email: email, password: password))
            .filterSuccessfulStatusCodes()
            .map(SignioEntity.self)
            .subscribe(handler)
    }
}
