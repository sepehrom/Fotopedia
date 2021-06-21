//
//  ImageSearchMasterInteractor.swift
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

class ImageSearchMasterInteractor: BaseInteractor {
    // MARK: - Properties
    var presenter: ImageSearchMasterPresenterProtocol!
    var router: ImageSearchMasterRouterProtocol!
	
	var imageLoader: ImageLoader?
	var lastSearchTerm: String = ""
	var lastFetchedPageNumber: Int = 1
	var currentImageDataArray: [ImageData] = []
	
	weak var selectionDelegate: ImageSelectionDelegate?
    
    // MARK: - Methods
	private override init() {}
	init(imageLoader: ImageLoader) {
		self.imageLoader = imageLoader
	}
}

// MARK: - ImageSearchMasterInteractorProtocol
extension ImageSearchMasterInteractor: ImageSearchMasterInteractorProtocol {
	func viewDidLoad() {
		self.presenter.presentSearchInstructions()
		selectionDelegate?.handleImageSelection("")
	}
	
	func didRequestCleanSearchForImages(searchTerm: String) {
		self.lastSearchTerm = searchTerm
		self.lastFetchedPageNumber = 0
		self.currentImageDataArray = []
		guard searchTerm != "" else {
			self.presenter.presentSearchInstructions()
			selectionDelegate?.handleImageSelection("")
			return
		}
		continueToSearchForImages(searchTerm: searchTerm)
	}
	
	func didScrollToTheEndOfSearchResult() {
		continueToSearchForImages(searchTerm: self.lastSearchTerm)
	}
	
	func continueToSearchForImages(searchTerm: String) {
		if (lastFetchedPageNumber == 0) {
			self.presenter.presentLoadingState()
		}
		imageLoader!.loadImages(searchTerm: searchTerm,
								page: lastFetchedPageNumber+1,
								successCallback: { imageDataArray in
									if (self.lastFetchedPageNumber == 0) {
										self.currentImageDataArray = imageDataArray
									} else {
										self.currentImageDataArray.append(contentsOf: imageDataArray)
									}
									self.lastFetchedPageNumber += 1
									self.presenter.presentImages(imagesDataArray: self.currentImageDataArray)
								}, failureCallback: { error in
									self.presenter.presentServerError(errorMessage: error.localizedDescription)
								})
	}
	
	func didSelectImage(url: String) {
		selectionDelegate?.handleImageSelection(url)
	}
}
