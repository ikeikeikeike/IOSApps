//
//  TradeStore.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/18.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import CSV
import Moya
import RxMoya
import RxSwift

protocol TradeStore {
    func request(name: TradeAPI, handler: @escaping (SingleEvent<[TradeEntity]>) -> Void)
}

struct TradeStoreImpl: TradeStore {
    fileprivate let provider: TradeProvider! = Injector.ct.resolve(TradeProvider.self)

    public func request(name: TradeAPI, handler: @escaping (SingleEvent<[TradeEntity]>) -> Void) {
        _ = provider.api.rx.request(name)
            .filterSuccessfulStatusCodes()
            .mapString()
            .map({ result in
                return (try CSVReader(string: result)).map({ r -> TradeEntity in
                    return TradeEntity(unixtime: Int(r[0]), price: Double(r[1]), amount: Double(r[2]))
                })
            })
            .subscribe(handler)
    }
}
