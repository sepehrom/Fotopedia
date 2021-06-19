//
//  RemoteImageLoader.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/19/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation

typealias ImageSearchSuccessResponseHandler = ([ImageData]) -> Void
typealias ImageSearchFailureResponseHandler = (Error) -> Void

class RemoteImageLoader: ImageLoader {
	// MARK: - Properties
	private let networkManager: ImageNetworkManager
	
	init(networkManager: ImageNetworkManager) {
		self.networkManager = networkManager
	}
	
	func loadImages(searchTerm: String) {
		networkManager.fetchImagesFromFlickr(service: .photosSearch(searchTerm: searchTerm),
											 successCallback: { (imageDataArray) in
												
											 }, failureCallback: { (error) in
												
											 })
	}
}
