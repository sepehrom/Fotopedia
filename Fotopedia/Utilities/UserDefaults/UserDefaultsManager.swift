//
//  UserDefaultsManager.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/22/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation

class UserDefaultsManager {
	let sharedUserDefaults: UserDefaults?
	
	init() {
		sharedUserDefaults = UserDefaults.standard
	}
	
	private func set(value: Any?, forKey key: UserDefaultsKeys) {
		sharedUserDefaults?.set(value, forKey: key.rawValue)
		sharedUserDefaults?.synchronize()
	}
	
	private func value(forKey key: UserDefaultsKeys) -> Any? {
		return sharedUserDefaults?.value(forKey: key.rawValue)
	}
}

// MARK: - UserDefaultsManagerProtocol
extension UserDefaultsManager: UserDefaultsManagerProtocol {
	func set(_ value: String, forKey key: UserDefaultsKeys) {
		set(value: value as Any, forKey: key)
	}
	
	func set(_ value: [String], forKey key: UserDefaultsKeys) {
		set(value: value, forKey: key)
	}
	
	func string(forKey key: UserDefaultsKeys) -> String? {
		let storedValue: String? = value(forKey: key) as? String
		return storedValue
	}
	
	func stringArray(forKey key: UserDefaultsKeys) -> [String]? {
		return value(forKey: key) as? [String]
	}
	
	func clear(forKey key: UserDefaultsKeys) {
		set(value: nil, forKey: key)
	}

	func synchronize() {
		sharedUserDefaults?.synchronize()
		UserDefaults.standard.synchronize()
	}
}
