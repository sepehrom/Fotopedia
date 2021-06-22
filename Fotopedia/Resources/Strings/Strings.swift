//
//  Strings.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/23/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation

struct Strings {
	struct MasterVC {
		static let searchBarPlaceholder = "Search for images..."
		static let navigationTitle      = "Fotopedia"
	}
	
	struct MasterPresenter {
		static let emptyStateDefaultText = "Use the search bar to find the images you want."
		static let noImagesFound         = "No images found.\nTry another search term."
	}
	
	struct DetailView {
		static let emptyStateDefaultText = "Search and select a photo to see the full size"
	}
}
