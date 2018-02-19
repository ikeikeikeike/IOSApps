//
//  CoincheckJPYUseCase.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/19.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import Moya
import RxMoya
import RxSwift

public protocol CoincheckJPYUseCase {
    func request(handler: @escaping (SingleEvent<[TradeModel]>) -> Void)
}

public struct CoincheckJPYUseCaseImpl: CoincheckJPYUseCase {

    fileprivate let coincheckJPYRepo: CoincheckJPYRepo! = Injector.ct.resolve(CoincheckJPYRepo.self)

    public func request(handler: @escaping (SingleEvent<[TradeModel]>) -> Void) {
        coincheckJPYRepo.request { event in
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
