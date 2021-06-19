//
//  ImageSearchDetailBuilder.swift
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

class ImageSearchDetailBuilder: BaseBuilder {
    // MARK: - Properties
    
    // MARK: - Methods
    class func build() -> (ImageSearchDetailViewController, ImageSearchDetailInteractor) {
        let viewController: ImageSearchDetailViewController =
			UIStoryboard(name: "ImageSearchDetailViewController", bundle: Bundle.main).instantiateInitialViewController() as! ImageSearchDetailViewController
        let interactor = ImageSearchDetailInteractor()
        let presenter = ImageSearchDetailPresenter()
        let router = ImageSearchDetailRouter()
        
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        interactor.router = router
        
        presenter.viewController = viewController
        
        router.viewControllerProtocol = viewController
        
        return (viewController, interactor)
    }
}
