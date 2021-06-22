//
//  RemoteImageLoader.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/19/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation

class RemoteImageLoader {
	
	// MARK: - Properties
	private let networkManager: ImageNetworkManager
	
	init(networkManager: ImageNetworkManager) {
		self.networkManager = networkManager
	}
}

// MARK: - ImageLoaderProtocol
extension RemoteImageLoader: ImageLoader {
	func loadImages(searchTerm: String,
					pageNumber: Int,
					successCallback: @escaping ImageSearchSuccessResponseHandler,
					failureCallback: @escaping ImageSearchFailureResponseHandler) {
		networkManager.fetchImagesFromFlickr(service: .photosSearch(searchTerm: searchTerm, pageNumber: pageNumber),
											 successCallback: { (imageDataArray) in
												successCallback(imageDataArray)
											 }, failureCallback: { (error) in
												failureCallback(error)
											 })
	}
}
