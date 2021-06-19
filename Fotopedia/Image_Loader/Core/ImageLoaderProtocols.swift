//
//  ImageLoaderProtocols.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/19/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation

protocol ImageLoader {
	func loadImages(searchTerm: String)
}

protocol ImageNetworkManager {
	func fetchImagesFromFlickr(service: FlickrAPIService,
							   successCallback: @escaping ImageSearchSuccessResponseHandler,
							   failureCallback: @escaping ImageSearchFailureResponseHandler)
}
