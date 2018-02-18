//
//  CoincheckJPYRepo.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/19.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Moya
import Result

public protocol CoincheckJPYRepo {
    func request(handler: @escaping (Result<Response, MoyaError>) -> Void)
}

public struct CoincheckJPYRepoImpl: CoincheckJPYRepo {
    public static let shared: CoincheckJPYRepo = CoincheckJPYRepoImpl()

    public func request(handler: @escaping (Result<Response, MoyaError>) -> Void) {
        let store = CoincheckJPYStoreFactory.createCoincheckJPYStore()
        store.request(handler: handler)
    }
}
