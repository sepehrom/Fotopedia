//
//  ImageCollectionViewCell.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/20/21.
//  Copyright © 2021. All rights reserved. 
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
	static let reuseIdentifier = "imageCell"
	@IBOutlet weak var imageView: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.imageView.layer.cornerRadius = 16
		self.imageView.layer.masksToBounds = true
	}
}
