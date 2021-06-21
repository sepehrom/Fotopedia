//
//  ImageCollectionViewCell.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/20/21.
//  Copyright © 2021. All rights reserved. 
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
	static let reuseIdentifier = "ImageCell"
	@IBOutlet weak var imageView: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.imageView.layer.cornerRadius = 8
		self.imageView.layer.masksToBounds = true
		self.imageView.contentMode = .scaleAspectFill
		self.imageView.layer.borderWidth = 4.0
		self.imageView.layer.borderColor = UIColor.black.cgColor
	}
}
