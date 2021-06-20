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
    
    // MARK: - Methods
	private override init() {}
	init(imageLoader: ImageLoader) {
		self.imageLoader = imageLoader
	}
}

extension ImageSearchMasterInteractor: ImageSearchMasterInteractorProtocol {
	func didRequestToSearchForImages(searchTerm: String) {
		guard searchTerm != "" else {
			self.presenter.presentSearchInstructions()
			return
		}
		self.presenter.presentLoadingState()
		imageLoader!.loadImages(searchTerm: searchTerm,
								successCallback: { imageDataArray in
									self.presenter.presentImages(imagesDataArray: imageDataArray)
								}, failureCallback: { error in
									self.presenter.presentServerError(errorMessage: error.localizedDescription)
								})
	}
	
    func viewDidLoad() {
		self.presenter.presentSearchInstructions()
    }
}
