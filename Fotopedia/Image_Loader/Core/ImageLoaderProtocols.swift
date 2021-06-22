//
//  ImageLoaderProtocols.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/19/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation

typealias ImageSearchSuccessResponseHandler = ([ImageData]) -> Void
typealias ImageSearchFailureResponseHandler = (Error) -> Void

protocol ImageLoader {
	func loadImages(searchTerm: String,
					pageNumber: Int,
					successCallback: @escaping ImageSearchSuccessResponseHandler,
					failureCallback: @escaping ImageSearchFailureResponseHandler)
}

protocol ImageNetworkManager {
	func fetchImagesFromFlickr(service: FlickrAPIService,
							   successCallback: @escaping ImageSearchSuccessResponseHandler,
							   failureCallback: @escaping ImageSearchFailureResponseHandler)
}
