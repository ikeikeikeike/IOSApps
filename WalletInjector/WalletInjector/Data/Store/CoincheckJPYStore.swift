//
//  CoincheckJPYStore.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/18.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Foundation
import Moya
import Result

protocol CoincheckJPYStore {
    func request(handler: @escaping (Result<Response, MoyaError>) -> Void)
}

struct CoincheckJPYStoreImpl: CoincheckJPYStore {

    fileprivate let provider: MoyaProvider<CoincheckJPYAPI> = {
        let stubClosure = { (target: CoincheckJPYAPI) -> StubBehavior in .never }
        let networkLoggerPlugin = NetworkLoggerPlugin(cURL: true)
        let plugins = [networkLoggerPlugin]
        return MoyaProvider<CoincheckJPYAPI>(stubClosure: stubClosure, plugins: plugins)
    }()

    public func request(handler: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(.trade) { result in handler(result) }
    }
}

struct CoincheckJPYStoreFactory {
    static func createCoincheckJPYStore() -> CoincheckJPYStore {
        return CoincheckJPYStoreImpl()
    }
}
