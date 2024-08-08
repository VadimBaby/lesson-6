//
//  UserStorage.swift
//  lesson-6
//
//  Created by Вадим Мартыненко on 07.08.2024.
//

import Foundation

enum UserStorageKey: String {
    case token
}

final class UserStorage  {
    static let shared = UserStorage()
    
    private let userDefaults: UserDefaults = .standard
    
    private init() {}
    
    var token: String? {
        get {
            self.string(forKey: .token)
        }
        set {
            setValue(newValue, forKey: .token)
        }
    }
}

private extension UserStorage {
    func setValue(_ value: Any?, forKey key: UserStorageKey) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }
    
    func string(forKey key: UserStorageKey) -> String? {
        userDefaults.string(forKey: key.rawValue)
    }
}
