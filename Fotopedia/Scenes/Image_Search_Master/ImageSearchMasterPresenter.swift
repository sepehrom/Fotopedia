//
//  ImageSearchMasterPresenter.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/20/21.
//  Copyright © 2021. All rights reserved.
//
//  This template was created and edited by Amir Sepehrom for Mobiquity's Code Challenge
//  interview so that the boilerplate code can be facilitated when we are applying clean
//  architecture principles to the assignment application.
//

import UIKit

class ImageSearchMasterPresenter: BasePresenter {
    // MARK: - Properties
    weak var viewController: ImageSearchMasterViewControllerProtocol!
    
    // MARK: - Methods
	func constructImageURLFromImageData(metadata: ImageData) -> String {
		return "http://farm\(metadata.farm).static.flickr.com/\(metadata.server)/\(metadata.identifier)_\(metadata.secret).jpg"
	}
}

extension ImageSearchMasterPresenter: ImageSearchMasterPresenterProtocol {
	func presentSearchInstructions() {
		viewController.updateEmptyStateView(emptyStateReason: "Use the search bar to find\nthe images you want.",
											emptyStateImage: UIImage(named: "imageIcon")!)
		viewController.updateLayoutState(newState: .noValidSearchResult)
	}
	
	func presentServerError(errorMessage: String) {
		viewController.updateEmptyStateView(emptyStateReason: errorMessage,
											emptyStateImage: UIImage(named: "serverError")!)
		viewController.updateLayoutState(newState: .noValidSearchResult)
	}
	
	func presentLoadingState() {
		viewController.updateLayoutState(newState: .searchInProgress)
	}
	
	func presentImages(imagesDataArray: [ImageData]) {
		if (imagesDataArray.count == 0) {
			viewController.updateEmptyStateView(emptyStateReason: "No images have been found.\nTry another search term.",
												emptyStateImage: UIImage(named: "noSearchResult")!)
			viewController.updateLayoutState(newState: .noValidSearchResult)
		} else {
			var imageURLs: [String] = []
			imagesDataArray.forEach { (imageData) in
				imageURLs.append(self.constructImageURLFromImageData(metadata: imageData))
			}
			viewController.updateImagesDataSource(newDataSource: imageURLs)
			viewController.updateLayoutState(newState: .displayingResult)
		}
	}
}
