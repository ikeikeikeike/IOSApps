//
//  CoincheckJPYProvider.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/19.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Moya

protocol CoincheckJPYProvider {
    var api: MoyaProvider<CoincheckJPYAPI> { get set }
}

struct CoincheckJPYProviderImpl: CoincheckJPYProvider {
    var api: MoyaProvider<CoincheckJPYAPI>

    init() {
        let stubClosure = { (target: CoincheckJPYAPI) -> StubBehavior in .never }
        let networkLoggerPlugin = NetworkLoggerPlugin(cURL: true)
        let plugins = [networkLoggerPlugin]

        api = MoyaProvider<CoincheckJPYAPI>(stubClosure: stubClosure, plugins: plugins)
    }
}
