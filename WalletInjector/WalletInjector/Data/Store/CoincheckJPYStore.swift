//
//  CoincheckJPYStore.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/18.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Foundation
import Moya
import RxMoya
import RxSwift

protocol CoincheckJPYData {
    func requestAPI(handler: @escaping (PrimitiveSequence<SingleTrait, Response>) -> Void)
}

struct CoincheckJPYDataImpl: CoincheckJPYData {

    fileprivate let provider: MoyaProvider<CoincheckJPYAPI> = {
        let stubClosure = { (target: CoincheckJPYAPI) -> StubBehavior in return .never }
        let networkLoggerPlugin = NetworkLoggerPlugin(cURL: true)
        let plugins = [networkLoggerPlugin]
        return MoyaProvider<CoincheckJPYAPI>(stubClosure: stubClosure, plugins: plugins)
    }()

    fileprivate let disposeBag = DisposeBag()
    fileprivate let didFinishGetMoneiesSubject = PublishSubject<[CoincheckJPY]>()

    public func requestAPI(handler: @escaping (PrimitiveSequence<SingleTrait, Response>) -> Void) {
        let unko = provider.rx
            .request(CoincheckJPYAPI.fetch)
            .map { (response) -> CoincheckJPY? in
                return try? JSONDecoder().decode(CoincheckJPY.self, from: response.data)
            }
//            .subscribe(onSuccess: { (response) in
//                if let unwrappedResponse = response {
//                    print(unwrappedResponse)
//                } else {
//                    print("error")
//                }
//            }, onError: { (error) in
//                print("error")
//            })
//            .disposed(by: disposeBag)
        
        unko    

//        let request = PublishAccessTokenNetworkRequest()
//        Session.send(request, callbackQueue: nil, handler: handler)
    }

}

//struct CoincheckJPYDataFactory {
//    static func createAuthDataStore() -> AuthDataStore {
//        return AuthDataStoreNetworkImpl()
//    }
//}
