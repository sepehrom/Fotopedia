//
//  MoyaImageNetworkManager.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/19/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation
import Moya

enum APIError: LocalizedError {
	case serverError(message: String)
	
	var errorDescription: String? {
		switch self {
		case let .serverError(message):
			return message
		}
	}
}

class MoyaImageNetworkManager: ImageNetworkManager {
	private var imageSearchResponseParser: ImageSearchResponseParser?
	private init() {}
	init(responseParser: ImageSearchResponseParser) {
		self.imageSearchResponseParser = responseParser
	}
	
	func fetchImagesFromFlickr(service: FlickrAPIService,
							   successCallback: @escaping ImageSearchSuccessResponseHandler,
							   failureCallback: @escaping ImageSearchFailureResponseHandler) {
		makeNetworkRequestForFetchingImagesFromFlickrAPI(service: service,
														 successCallback: successCallback,
														 failureCallback: failureCallback,
														 networkProvider: MoyaProvider<FlickrAPIService>())
	}
	
	func makeNetworkRequestForFetchingImagesFromFlickrAPI(service: FlickrAPIService,
														  successCallback: @escaping ImageSearchSuccessResponseHandler,
														  failureCallback: @escaping ImageSearchFailureResponseHandler,
														  networkProvider: MoyaProvider<FlickrAPIService>) {
		networkProvider.request(service) { result in
			do {
				switch result {
				case let .success(response):
					let responseData = response.data
					let statusCode = response.statusCode
					if statusCode == 200 {
						let responseObject = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String : Any]
						if (responseObject?["stat"] as! String == "ok") {
							let imageDataArray = self.imageSearchResponseParser!.parse(responseObject: responseObject!)
							successCallback(imageDataArray)
						} else {
							failureCallback(APIError.serverError(message: responseObject!["message"]! as! String))
						}
					}
				case let .failure(error):
					failureCallback(error)
				}
			} catch {
				failureCallback(error)
			}
		}
	}
}
