//
//  LoginPresenter.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/15.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Moya
import RxMoya
import RxSwift

public protocol LoginPresenter {
    func signin(email: String, password: String, handler: @escaping (SingleEvent<SignioModel>) -> Void)
    func signup(email: String, password: String, handler: @escaping (SingleEvent<SignioModel>) -> Void)
}

public class LoginPresenterImpl: LoginPresenter {

    let useCase: WalletUseCase! = Injector.ct.resolve(WalletUseCase.self)

    public func signin(email: String, password: String, handler: @escaping (SingleEvent<SignioModel>) -> Void) {
        useCase.signin(email: email, password: password, handler: handler)
    }

    public func signup(email: String, password: String, handler: @escaping (SingleEvent<SignioModel>) -> Void) {
        useCase.signup(email: email, password: password, handler: handler)
    }

}
