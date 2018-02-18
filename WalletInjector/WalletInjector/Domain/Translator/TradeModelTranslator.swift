//
//  CoincheckJPYTranslator.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/19.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Foundation

internal struct TradeModelTranslator: Translator {
    internal func translate(_ entity: TradeEntity) -> TradeModel {
        let unixtime: Int = entity.unixtime
        let price: Float = entity.price
        let amount: Float = entity.amount

        return TradeModel(unixtime: unixtime, price: price, amount: amount)
    }

    internal func translate(_ entities: [TradeEntity]) -> [TradeModel] {
        return entities.map(translate)
    }
}
