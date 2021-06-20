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
import Kingfisher

class ImageSearchMasterViewController: BaseViewController {
    // MARK: - Properties
	var imagesDataSource: [String] = []
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
		imageSearchMasterView.collectionView.dataSource = self
		imageSearchMasterView.collectionView.delegate = self
	}
}

// MARK: - UICollectionViewDataSource
extension ImageSearchMasterViewController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return imagesDataSource.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
		cell.imageView.kf.setImage(with: URL(string: self.imagesDataSource[indexPath.row]))
		return cell
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ImageSearchMasterViewController: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.bounds.size.width/2, height: collectionView.bounds.size.width/2)
	}
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}

	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}

	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets.zero
	}
}

// MARK: - UICollectionViewDelegate
extension ImageSearchMasterViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: true)
		
	}
}

// MARK: - ImageSearchMasterViewControllerProtocol
extension ImageSearchMasterViewController: ImageSearchMasterViewControllerProtocol {

}
