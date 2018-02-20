//
//  CoincheckJPYStore.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/18.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import CSV
import Moya
import RxMoya
import RxSwift

protocol CoincheckJPYStore {
    func request(handler: @escaping (SingleEvent<[TradeEntity]>) -> Void)
}

struct CoincheckJPYStoreImpl: CoincheckJPYStore {
    fileprivate let provider: CoincheckJPYProvider! = Injector.ct.resolve(CoincheckJPYProvider.self)

    public func request(handler: @escaping (SingleEvent<[TradeEntity]>) -> Void) {
        _ = provider.api.rx.request(.trades)
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
