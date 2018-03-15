//
//  WalletModelTranslator.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/16.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

internal struct SignioModelTranslator: Translator {
    internal func translate(_ entity: SignioEntity) -> SignioModel {
        let token: String = entity.token ?? ""
        return SignioModel(token: token)
    }

    internal func translate(_ entities: [SignioEntity]) -> [SignioModel] {
        return entities.map(translate)
    }
}
