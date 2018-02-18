//
//  TradeEntity.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/19.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

struct Trade: Codable {
    let unixtime: Int
    let price: Float
    let amount: Float
    
    private enum CodingKeys: String, CodingKey {
        case unixtime
        case price
        case amount
    }
}
