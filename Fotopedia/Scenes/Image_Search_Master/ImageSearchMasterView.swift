//
//  ImageSearchMasterView.swift
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

class ImageSearchMasterView: UIView {
    // MARK: - Properties
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var emptyStateView: UIView!
	@IBOutlet weak var emptyStateReasonImage: UIImageView!
	@IBOutlet weak var emptyStateReasonLabel: UILabel!
	@IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
	
    // MARK: - Methods
    // MARK: NSObject
    override func awakeFromNib() {
        super.awakeFromNib()
		self.backgroundColor = UIColor.systemBackground
		
		self.emptyStateReasonLabel.numberOfLines = 0
		self.emptyStateReasonLabel.textAlignment = .center
		self.emptyStateReasonImage.backgroundColor = .clear
		
		self.collectionView.keyboardDismissMode = .onDrag
		self.collectionView.backgroundColor = UIColor.systemBackground
    }
}
