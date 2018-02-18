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

    fileprivate let provider: MoyaProvider<CoincheckJPYAPI> = {
        let stubClosure = { (target: CoincheckJPYAPI) -> StubBehavior in .never }
        let networkLoggerPlugin = NetworkLoggerPlugin(cURL: true)
        let plugins = [networkLoggerPlugin]
        return MoyaProvider<CoincheckJPYAPI>(stubClosure: stubClosure, plugins: plugins)
    }()

    fileprivate let decoder = JSONDecoder()
    fileprivate let disposeBag = DisposeBag()
    
    public func request(handler: @escaping (SingleEvent<[TradeEntity]>) -> Void) {
        provider.rx.request(.trades)
            .filterSuccessfulStatusCodes()
            .map([TradeEntity].self, atKeyPath: "trades", using: decoder, failsOnEmptyData: true)
            .subscribe(handler)
            .disposed(by: disposeBag)
    }
}

struct CoincheckJPYStoreFactory {
    static func createCoincheckJPYStore() -> CoincheckJPYStore {
        return CoincheckJPYStoreImpl()
    }
}
