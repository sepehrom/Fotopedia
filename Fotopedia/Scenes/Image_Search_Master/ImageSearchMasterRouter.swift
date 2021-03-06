//
//  ImageSearchMasterRouter.swift
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

class ImageSearchMasterRouter: BaseRouter {
    // MARK: - Properties
    weak var viewControllerProtocol: ImageSearchMasterViewControllerProtocol!
    
    // MARK: - Methods
}

// MARK: - ImageSearchMasterRouterProtocol
extension ImageSearchMasterRouter: ImageSearchMasterRouterProtocol {

}
