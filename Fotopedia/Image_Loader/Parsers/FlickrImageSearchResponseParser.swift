//
//  FlickrImageSearchResponseParser.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/20/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation

class FlickrImageSearchResponseParser: ImageSearchResponseParser {
	func parse(responseObject: Dictionary<String, Any>) -> [ImageData] {
		var result = Array<ImageData>()
		let photosDic = responseObject["photos"]! as! Dictionary<String, Any>
		let photosArray = photosDic["photo"] as! Array<Dictionary<String, Any>>
		
		photosArray.forEach { (photoData) in
			let newImageData = ImageData(identifier: photoData["id"] as! String,
										 owner:      photoData["owner"] as! String,
										 secret:     photoData["secret"] as! String,
										 server:     photoData["server"] as! String,
										 farm:       photoData["farm"] as! Int,
										 title:      photoData["title"] as! String,
										 isPublic:   photoData["ispublic"] as! Bool,
										 isFriend:   photoData["isfriend"] as! Bool,
										 isFamily:   photoData["isfamily"] as! Bool)
			result.append(newImageData)
		}
		return result
	}
}
