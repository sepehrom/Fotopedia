//
//  RemoteImageLoader.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/19/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation

class RemoteImageLoader: ImageLoader {
	
	// MARK: - Properties
	private let networkManager: ImageNetworkManager
	
	init(networkManager: ImageNetworkManager) {
		self.networkManager = networkManager
	}
	
	func loadImages(searchTerm: String,
					page: Int,
					successCallback: @escaping ImageSearchSuccessResponseHandler,
					failureCallback: @escaping ImageSearchFailureResponseHandler) {
		networkManager.fetchImagesFromFlickr(service: .photosSearch(searchTerm: searchTerm, page: page),
											 successCallback: { (imageDataArray) in
												successCallback(imageDataArray)
											 }, failureCallback: { (error) in
												failureCallback(error)
											 })
	}
}
