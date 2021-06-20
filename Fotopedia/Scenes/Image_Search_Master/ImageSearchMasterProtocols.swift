//
//  ImageSearchMasterProtocols.swift
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

protocol ImageSearchMasterInteractorProtocol: BaseInteractorProtocol {
	func didRequestCleanSearchForImages(searchTerm: String)
	func didScrollToTheEndOfSearchResult()
}

protocol ImageSearchMasterPresenterProtocol: BasePresenterProtocol {
	func presentImages(imagesDataArray: [ImageData])
	func presentServerError(errorMessage: String)
	func presentSearchInstructions()
	func presentLoadingState()
}

protocol ImageSearchMasterViewControllerProtocol: BaseViewControllerProtocol{
	func updateImagesDataSource(newDataSource: [String])
	func updateEmptyStateView(emptyStateReason: String, emptyStateImage: UIImage)
	func updateLayoutState(newState: ImageListState)
}

protocol ImageSearchMasterRouterProtocol: BaseRouterProtocol {
}
