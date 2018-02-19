//
//  CoincheckJPYRepo.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/19.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Moya
import RxMoya
import RxSwift

public protocol CoincheckJPYRepo {
    func request(handler: @escaping (SingleEvent<[TradeEntity]>) -> Void)
}

public struct CoincheckJPYRepoImpl: CoincheckJPYRepo {
    public static let shared: CoincheckJPYRepo = CoincheckJPYRepoImpl()
    fileprivate let store: CoincheckJPYStore! = Injector.ct.resolve(CoincheckJPYStore.self)

    public func request(handler: @escaping (SingleEvent<[TradeEntity]>) -> Void) {
        store.request(handler: handler)
    }
}
