//
//  ImageListBuilder.swift
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

class ImageListBuilder: BaseBuilder {
    // MARK: - Properties
    
    // MARK: - Methods
    class func build() -> (ImageListViewController, ImageListInteractor) {
        let viewController: ImageListViewController = UIStoryboard(name: "ImageListViewController", bundle: Bundle.main).instantiateInitialViewController() as! ImageListViewController
        let interactor = ImageListInteractor()
        let presenter = ImageListPresenter()
        let router = ImageListRouter()
        
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        interactor.router = router
        
        presenter.viewController = viewController
        
        router.viewControllerProtocol = viewController
        
        return (viewController, interactor)
    }
}
