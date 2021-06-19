//
//  ImageSearchResponseParser.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/20/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation

protocol ImageSearchResponseParser {
	func parse(responseObject: Dictionary<String, Any>) -> [ImageData]
}
