//
//  ImageSearchMasterBuilder.swift
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

class ImageSearchMasterBuilder: BaseBuilder {
    // MARK: - Properties
    
    // MARK: - Methods
    class func build() -> (ImageSearchMasterViewController, ImageSearchMasterInteractor) {
        let viewController: ImageSearchMasterViewController =
			UIStoryboard(name: "ImageSearchMasterViewController", bundle: Bundle.main).instantiateInitialViewController() as! ImageSearchMasterViewController
		let interactor = ImageSearchMasterInteractor(imageLoader: RemoteImageLoader(networkManager: MoyaImageNetworkManager(responseParser: FlickrImageSearchResponseParser())))
        let presenter = ImageSearchMasterPresenter()
        let router = ImageSearchMasterRouter()
        
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        interactor.router = router
		interactor.storageManager = UserDefaultsManager()
        
        presenter.viewController = viewController
        
        router.viewControllerProtocol = viewController
        
        return (viewController, interactor)
    }
}
