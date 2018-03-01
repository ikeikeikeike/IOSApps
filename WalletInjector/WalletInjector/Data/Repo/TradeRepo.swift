//
//  TradeRepo.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/19.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Moya
import RxMoya
import RxSwift

public protocol TradeRepo {
    func request(name: String, handler: @escaping (SingleEvent<[TradeEntity]>) -> Void)
}

public struct TradeRepoImpl: TradeRepo {
    public static let shared: TradeRepo = TradeRepoImpl()
    fileprivate let store: TradeStore! = Injector.ct.resolve(TradeStore.self)

    public func request(name: String, handler: @escaping (SingleEvent<[TradeEntity]>) -> Void) {
        store.request(name: TradeAPI(rawValue: name)!, handler: handler)
    }
}
