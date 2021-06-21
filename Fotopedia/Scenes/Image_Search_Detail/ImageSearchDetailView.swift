//
//  ImageSearchDetailView.swift
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

class ImageSearchDetailView: UIView {
    // MARK: - Properties
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var emptyStateView: UIView!
	@IBOutlet weak var emptyStateIcon: UIImageView!
	@IBOutlet weak var emptyStateLabel: UILabel!
	
    // MARK: - Methods
    // MARK: NSObject
    override func awakeFromNib() {
        super.awakeFromNib()
		
		emptyStateView.backgroundColor = .clear
		emptyStateIcon.image = UIImage(named: "noImageSelected")
		
		emptyStateLabel.text = "Search and select a photo to see the full size"
		emptyStateLabel.textAlignment = .center
		emptyStateLabel.numberOfLines = 0
    }
}
