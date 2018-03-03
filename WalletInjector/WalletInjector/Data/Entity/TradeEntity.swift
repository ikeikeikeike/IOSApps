//
//  TradeEntity.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/19.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

public struct TradeEntity: Codable {
    let unixtime: Int?
    let price: Double?
    let amount: Double?

    private enum CodingKeys: String, CodingKey {
        case unixtime
        case price
        case amount
    }

    func isValid() -> Bool {
        return unixtime != nil && price != nil && amount != nil
    }
}
