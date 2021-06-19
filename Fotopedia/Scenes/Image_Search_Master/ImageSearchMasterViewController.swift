//
//  ImageSearchMasterViewController.swift
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

class ImageSearchMasterViewController: BaseViewController {
    // MARK: - Properties
    var imageSearchMasterInteractor: ImageSearchMasterInteractorProtocol! {
        get {
            return interactor as? ImageSearchMasterInteractorProtocol
        }
        set {
            interactor = newValue
        }
    }
    private var imageSearchMasterView: ImageSearchMasterView {
        return view as! ImageSearchMasterView
    }
    
    // MARK: - Methods
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ImageSearchMasterViewController: ImageSearchMasterViewControllerProtocol {

}
