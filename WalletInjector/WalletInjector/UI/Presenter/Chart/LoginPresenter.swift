//
//  LoginPresenter.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/15.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

public protocol LoginPresenter {

    weak var view: LoginPresenterView! { get set }

}

public protocol LoginPresenterView: class {

}

public class LoginPresenterImpl: LoginPresenter {

    weak public var view: LoginPresenterView!

//    let useCase: AccountUseCase! = Injector.ct.resolve(AccountUseCase.self)

//    fileprivate var tradeModels: [TradeModel] = [] {
//        didSet {
//            reloadView(tradeModels: tradeModels)
//        }
//    }

}
