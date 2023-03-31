//
//  LocalStorage.swift
//  Azion RTM
//
//  Created by Joao Narciso on 13/03/23.
//

import Foundation

class LocalStorage {
    
    private static let myKey: String = "myKey"
    
    public static var myValue: String {
        set {
            UserDefaults.standard.set(newValue, forKey: myKey)
        }
        get {
            return UserDefaults.standard.string(forKey: myKey) ?? ""
        }
    }
    
    public static func removeValue() {
        UserDefaults.standard.removeObject(forKey: myKey)
    }

}
