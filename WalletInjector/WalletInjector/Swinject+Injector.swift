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
        ct.register(TradeProvider.self) { _ in TradeProviderImpl() }
        ct.register(TradeStore.self) { _ in TradeStoreImpl() }
        ct.register(TradeRepo.self) { _ in TradeRepoImpl() }
        ct.register(TradeUseCase.self) { _ in TradeUseCaseImpl() }
    }
}
