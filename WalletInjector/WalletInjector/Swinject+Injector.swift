//
//  Injector.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/18.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Swinject

final class Injector {
    static let ct = Container()

    class func initialize() {
        ct.register(CoincheckJPYProvider.self) { _ in CoincheckJPYProviderImpl() }
        ct.register(CoincheckJPYStore.self) { _ in CoincheckJPYStoreImpl() }
        ct.register(CoincheckJPYRepo.self) { _ in CoincheckJPYRepoImpl() }
        ct.register(CoincheckJPYUseCase.self) { _ in CoincheckJPYUseCaseImpl() }
    }
}
