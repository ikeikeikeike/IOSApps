//
//  TradeProvider.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/19.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Moya

protocol TradeProvider {
    var api: MoyaProvider<TradeAPI> { get }
}

struct TradeProviderImpl: TradeProvider {
    var api: MoyaProvider<TradeAPI> = {
        let stubClosure = { (target: TradeAPI) -> StubBehavior in .never }
        let networkLoggerPlugin = NetworkLoggerPlugin(cURL: true)
        let plugins = [networkLoggerPlugin]

        return MoyaProvider<TradeAPI>(stubClosure: stubClosure, plugins: plugins)
    }()
}
