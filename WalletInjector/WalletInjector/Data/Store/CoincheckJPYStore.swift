//
//  CoincheckJPYStore.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/18.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Moya
import RxMoya
import RxSwift

protocol CoincheckJPYStore {
    func request(handler: @escaping (SingleEvent<[TradeEntity]>) -> Void)
}

struct CoincheckJPYStoreImpl: CoincheckJPYStore {
    fileprivate let provider: CoincheckJPYProvider! = Injector.ct.resolve(CoincheckJPYProvider.self)
    fileprivate let decoder = JSONDecoder()

    public func request(handler: @escaping (SingleEvent<[TradeEntity]>) -> Void) {
        _ = provider.api.rx.request(.trades)
            .filterSuccessfulStatusCodes()
            .map([TradeEntity].self, atKeyPath: "trades", using: decoder, failsOnEmptyData: true)
            .subscribe(handler)
    }
}
