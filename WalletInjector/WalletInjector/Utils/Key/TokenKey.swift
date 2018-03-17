//
//  TokenKey.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/18.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import KeychainAccess

public protocol TokenKey {
    func set(token: String) -> Bool
    func get() -> String?
    func exists() -> Bool
}

struct TokenKeyImpl: TokenKey {
    fileprivate let key = "jwttoken"
    fileprivate let keychain: Keychain = Keychain(service: Bundle.main.bundleIdentifier!)

    public func set(token: String) -> Bool {
        if (try? keychain.set(token, key: key)) == nil {
           return false
        }
        return true
    }

    public func get() -> String? {
        return try? keychain.getString(key)!
    }

    public func exists() -> Bool {
        guard let token = get() else {
            return false
        }
        if token.isEmpty {
            return false
        }

        return true
    }

}
