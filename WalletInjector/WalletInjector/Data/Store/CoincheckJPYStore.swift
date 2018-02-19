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

protocol CoincheckJPYStore {
    func request(handler: @escaping (SingleEvent<[TradeEntity]>) -> Void)
}

struct CoincheckJPYStoreImpl: CoincheckJPYStore {

    fileprivate let provider: CoincheckJPYProvider! = Injector.ct.resolve(CoincheckJPYProvider.self)
    fileprivate let decoder = JSONDecoder()
    fileprivate let disposeBag = DisposeBag()

    public func request(handler: @escaping (SingleEvent<[TradeEntity]>) -> Void) {
        provider.api.rx.request(.trades)
            .filterSuccessfulStatusCodes()
            .map([TradeEntity].self, atKeyPath: "trades", using: decoder, failsOnEmptyData: true)
            .subscribe(handler)
            .disposed(by: disposeBag)
    }
}
