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
        prepared()
        inject()
    }

    private class func prepared() {
        ct.register(TokenKey.self) { _ in TokenKeyImpl() }
    }

    private class func inject() {
        ct.register(TradeProvider.self) { _ in TradeProviderImpl() }
        ct.register(TradeStore.self) { _ in TradeStoreImpl() }
        ct.register(TradeRepo.self) { _ in TradeRepoImpl() }
        ct.register(TradeUseCase.self) { _ in TradeUseCaseImpl() }

        ct.register(WalletProvider.self) { _ in WalletProviderImpl() }
        ct.register(WalletStore.self) { _ in WalletStoreImpl() }
        ct.register(WalletRepo.self) { _ in WalletRepoImpl() }
        ct.register(WalletUseCase.self) { _ in WalletUseCaseImpl() }
    }
}
