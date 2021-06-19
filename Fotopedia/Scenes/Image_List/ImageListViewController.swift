//
//  ImageListViewController.swift
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

class ImageListViewController: BaseViewController {
    // MARK: - Properties
    var imageListInteractor: ImageListInteractorProtocol! {
        get {
            return interactor as? ImageListInteractorProtocol
        }
        set {
            interactor = newValue
        }
    }
    private var imageListView: ImageListView {
        return view as! ImageListView
    }
    
    // MARK: - Methods
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ImageListViewController: ImageListViewControllerProtocol {

}
