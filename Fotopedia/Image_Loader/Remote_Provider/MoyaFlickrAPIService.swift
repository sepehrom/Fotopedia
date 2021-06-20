//
//  MoyaFlickrAPIService.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/19/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation
import Moya

extension FlickrAPIService: TargetType {
	var baseURL: URL {
		return URL(string: "https://api.flickr.com")!
	}
	
	var path: String {
		switch self {
		case .photosSearch(_):
			return "/services/rest/"
		}
	}
	
	var method: Moya.Method {
		switch self {
		case .photosSearch:
			return .get
		}
	}
	
	var sampleData: Data {
		switch self {
		case .photosSearch:
			return Data()
		}
	}
	
	var task: Task {
		switch self {
		case let .photosSearch(searchTerm):
			return .requestParameters(parameters: ["method":"flickr.photos.search",
												   "api_key":"11c40ef31e4961acf4f98c8ff4e945d7",
												   "format":"json",
												   "nojsoncallback": 1,
												   "sort":"relevance",
												   "text": searchTerm],
									  encoding: URLEncoding.queryString)
		}
	}
	
	var headers: [String : String]? {
		return [:]
	}
	
	
}
