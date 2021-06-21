//
//  ImageSearchDetailPresenter.swift
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

class ImageSearchDetailPresenter: BasePresenter {
    // MARK: - Properties
    weak var viewController: ImageSearchDetailViewControllerProtocol!
    
    // MARK: - Methods
}

extension ImageSearchDetailPresenter: ImageSearchDetailPresenterProtocol {
	func presentImage(_ imageURL: String) {
		if (imageURL == "") {
			viewController.displayEmptyState()
		} else {
			viewController.displayFullImage(imageURL)
		}
	}
}
