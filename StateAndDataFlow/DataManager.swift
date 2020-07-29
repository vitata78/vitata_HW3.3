//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Andrew Tolstov on 7/28/20.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults.standard
    private let userKey = "userName"
    
    private init() {}
    
    func saveUser(with name: String) {
        userDefaults.set(name, forKey: userKey)
    }
    
    func fetchUser() -> String {
        if let userName = userDefaults.value(forKey: userKey) as? String {
            return userName
        }
        return ""
    }
    
    func deleteUser() {
        userDefaults.removeObject(forKey: userKey)
    }
    
}
