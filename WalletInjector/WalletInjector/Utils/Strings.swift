//
//  Strings.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/02.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import Foundation

extension String {
    func firstUppercase() -> String {
        return prefix(1).uppercased() + dropFirst()
    }

    mutating func upperFirstLetter() {
        self = self.firstUppercase()
    }

    func firstLowercase() -> String {
        return prefix(1).lowercased() + dropFirst()
    }

    mutating func lowerFirstLetter() {
        self = self.firstLowercase()
    }
}
