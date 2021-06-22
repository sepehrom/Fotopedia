//
//  UserDefaultsManagerProtocol.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/23/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation

enum UserDefaultsKeys: String {
	case searchHistory = "searchHistory"
}

protocol UserDefaultsManagerProtocol {
	func set(_ value: String,   forKey key: UserDefaultsKeys)
	func set(_ value: [String], forKey key: UserDefaultsKeys)
	
	func string(     forKey key: UserDefaultsKeys) -> String?
	func stringArray(forKey key: UserDefaultsKeys) -> [String]?
	
	func clear(forKey key: UserDefaultsKeys)
	func synchronize()
}

