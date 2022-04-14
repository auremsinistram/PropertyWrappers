//
// Store.swift
//

import Foundation
import Extensions

@propertyWrapper
public struct Store<T: Codable> {
    
    // MARK: - Private let
    
    private let key: String
    
    private let defaultValue: T
    
    private let suiteName: String?
    
    // MARK: - Public var
    
    public var wrappedValue: T {
        get {
            return (try? userDefaults.get(T.self, key)) ?? defaultValue
        }
        set {
            try? userDefaults.set(newValue, key)
        }
    }
    
    // MARK: - Private var
    
    private var userDefaults: UserDefaults {
        return UserDefaults(suiteName: suiteName) ?? .standard
    }
    
    // MARK: - Public init
    
    public init(_ key: String, _ defaultValue: T, _ suiteName: String? = nil) {
        self.key = key
        self.defaultValue = defaultValue
        self.suiteName = suiteName
    }
}
