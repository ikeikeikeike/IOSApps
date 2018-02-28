//
//  ChartPresenter.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/20.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

public protocol ChartPresenter {

    weak var view: ChartPresenterView! { get set }

    func setupUI()
    func refreshData()
}

public protocol ChartPresenterView: class {
    func reloadView(chartVM: ChartViewModel)
}

public class ChartPresenterImpl: ChartPresenter {

    weak public var view: ChartPresenterView!

    let useCase: CoincheckJPYUseCase! = Injector.ct.resolve(CoincheckJPYUseCase.self)

    fileprivate var tradeModels: [TradeModel] = [] {
        didSet {
            reloadView(tradeModels: tradeModels)
        }
    }

    public func setupUI() {

    }

    public func refreshData() {
        useCase.request { result in
            switch result {
            case .success(let trades):
                self.tradeModels = trades

            case .error(let error):
                print(error) // TODO: Logger
            }
        }
    }

    private func reloadView(tradeModels: [TradeModel]) {
        let chartVM = ChartViewModelImpl(tradeModels: tradeModels)
        view.reloadView(chartVM: chartVM)
    }

}
