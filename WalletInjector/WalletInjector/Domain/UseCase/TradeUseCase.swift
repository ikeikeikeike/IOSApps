//
//  TradeUseCase.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/19.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import Moya
import RxMoya
import RxSwift

public protocol TradeUseCase {
    func request(name: String, handler: @escaping (SingleEvent<[TradeModel]>) -> Void)
}

public struct TradeUseCaseImpl: TradeUseCase {

    fileprivate let tradeRepo: TradeRepo! = Injector.ct.resolve(TradeRepo.self)

    public func request(name: String, handler: @escaping (SingleEvent<[TradeModel]>) -> Void) {
        tradeRepo.request(name: name) { event in
            switch event {
            case .success(let trades):
                let models = TradeModelTranslator().translate(trades)
                handler(SingleEvent.success(models))
            case .error(let error):
                handler(SingleEvent.error(error))
            }
        }
    }
}
