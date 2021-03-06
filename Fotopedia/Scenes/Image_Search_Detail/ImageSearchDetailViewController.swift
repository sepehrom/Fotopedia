//
//  ImageSearchDetailViewController.swift
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

class ImageSearchDetailViewController: BaseViewController {
    // MARK: - Properties
    var imageSearchDetailInteractor: ImageSearchDetailInteractorProtocol! {
        get {
            return interactor as? ImageSearchDetailInteractorProtocol
        }
        set {
            interactor = newValue
        }
    }
    private var imageSearchDetailView: ImageSearchDetailView {
        return view as! ImageSearchDetailView
    }
    
    // MARK: - Methods
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - ImageSearchDetailViewControllerProtocol
extension ImageSearchDetailViewController: ImageSearchDetailViewControllerProtocol {
	func displayEmptyState() {
		imageSearchDetailView.imageView.isHidden      = true
		imageSearchDetailView.emptyStateView.isHidden = false
	}
	func displayFullImage(_ imageURL: String) {
		imageSearchDetailView.imageView.isHidden      = false
		imageSearchDetailView.emptyStateView.isHidden = true
		
		imageSearchDetailView.imageView.kf.setImage(with: URL(string: imageURL))
	}
}
