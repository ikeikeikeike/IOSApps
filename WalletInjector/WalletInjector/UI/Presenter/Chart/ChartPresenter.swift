//
//  ChartPresenter.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/20.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

public protocol ChartPresenter {

    weak var view: ChartPresenterView? { get set }

    func setupUI()
}

public protocol ChartPresenterView: class {

}

public class ChartPresenterImpl: ChartPresenter {

    weak public var view: ChartPresenterView?

    let useCase: CoincheckJPYUseCase! = Injector.ct.resolve(CoincheckJPYUseCase.self)
    fileprivate var tradeModel: TradeModel!

    public func setupUI() {
        useCase.request { result in
            switch result {
            case .success(let trades):
                print("success")
                print("success")
                print("success")

                print(trades)

            case .error(let error):
                print("error")
                print("error")
                print("error")
                
                print(error)
            }
        }
    }

}
