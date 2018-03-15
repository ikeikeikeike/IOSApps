//
//  AccountUseCase.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/15.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import Moya
import RxMoya
import RxSwift

public protocol WalletUseCase {
    func signin(email: String, password: String, handler: @escaping (SingleEvent<SignioModel>) -> Void)
    func signup(email: String, password: String, handler: @escaping (SingleEvent<SignioModel>) -> Void)
}

public struct WalletUseCaseImpl: WalletUseCase {

    fileprivate let walletRepo: WalletRepo! = Injector.ct.resolve(WalletRepo.self)

    public func signin(email: String, password: String, handler: @escaping (SingleEvent<SignioModel>) -> Void) {
        walletRepo.signin(email: email, password: password) { event in
            switch event {
            case .success(let entity):
                let model = SignioModelTranslator().translate(entity)
                handler(SingleEvent.success(model))
            case .error(let error):
                handler(SingleEvent.error(error))
            }
        }
    }

    public func signup(email: String, password: String, handler: @escaping (SingleEvent<SignioModel>) -> Void) {
        walletRepo.signup(email: email, password: password) { event in
            switch event {
            case .success(let entity):
                let model = SignioModelTranslator().translate(entity)
                handler(SingleEvent.success(model))
            case .error(let error):
                handler(SingleEvent.error(error))
            }
        }
    }
}
