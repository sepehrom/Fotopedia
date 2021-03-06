//
//  ImageSearchDetailProtocols.swift
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

protocol ImageSearchDetailInteractorProtocol: BaseInteractorProtocol {
}

protocol ImageSearchDetailPresenterProtocol: BasePresenterProtocol {
	func presentImage(_ imageURL: String)
}

protocol ImageSearchDetailViewControllerProtocol: BaseViewControllerProtocol{
	func displayEmptyState()
	func displayFullImage(_ imageURL: String)
}

protocol ImageSearchDetailRouterProtocol: BaseRouterProtocol {
}

protocol ImagePresentationDelegate: class {
	func handleImagePresentation(_ imageURL: String)
}
