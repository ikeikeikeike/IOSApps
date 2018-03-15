//
//  WalletEntity.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/16.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

public struct SignioEntity: Codable {
    let token: String?

    private enum CodingKeys: String, CodingKey {
        case token = "token"
    }
}
