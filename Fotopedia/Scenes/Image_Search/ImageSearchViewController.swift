//
//  ImageSearchViewController.swift
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

class ImageSearchViewController: BaseSplitViewController {
    // MARK: - Properties
    var imageSearchInteractor: ImageSearchInteractorProtocol! {
        get {
            return interactor as? ImageSearchInteractorProtocol
        }
        set {
            interactor = newValue
        }
    }
    private var imageSearchView: ImageSearchView {
        return view as! ImageSearchView
    }
    
    // MARK: - Methods
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
		self.delegate = self
		self.preferredDisplayMode      = .oneBesideSecondary
		self.preferredSplitBehavior    = .tile
    }
}

// MARK: - UISplitViewControllerDelegate
extension ImageSearchViewController: UISplitViewControllerDelegate {
	func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
		return .primary
	}
}

// MARK: - ImageSearchViewControllerProtocol
extension ImageSearchViewController: ImageSearchViewControllerProtocol {
	func properlyPresentDetailView() {
		if self.isCollapsed {
			self.showDetailViewController(viewController(for: .secondary)!, sender: nil)
		}
	}
}
