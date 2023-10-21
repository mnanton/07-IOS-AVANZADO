//
//  KeyChainConnection.swift
//  DBHeroes
//
//  Created by Miguel Nantón Díaz on 21/10/23.
//

import Foundation
import KeychainSwift

protocol KeyChainProtocol {
    func setToken(token: String)
    func getToken() -> String?
}

final class KeyChainConnection: KeyChainProtocol {
    private let keychain = KeychainSwift()

    private enum Key {
        static let token = "KEY_KEYCHAIN_TOKEN"
    }

    func setToken(token: String) {
        keychain.set(token, forKey: Key.token)
    }

    func getToken() -> String? {
        keychain.get(Key.token)
    }
}
