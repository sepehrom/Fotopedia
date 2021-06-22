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

enum ImageListState {
	case noValidSearchResult
	case searchInProgress
	case displayingResult
}

class ImageSearchMasterViewController: BaseViewController {
    // MARK: - Properties
	var currentImageListState: ImageListState = .noValidSearchResult {
		didSet {
			self.imageSearchMasterView.loadingIndicator.isHidden = (currentImageListState != .searchInProgress)
			self.imageSearchMasterView.emptyStateView.isHidden = (currentImageListState != .noValidSearchResult)
			self.imageSearchMasterView.collectionView.isHidden = (currentImageListState != .displayingResult)
		}
	}
	var currentEmptyStateReason: String = "" {
		didSet {
			self.imageSearchMasterView.emptyStateReasonLabel.text = currentEmptyStateReason
		}
	}
	var currentEmptyStateImage: UIImage = UIImage(named: "imageIcon")! {
		didSet {
			self.imageSearchMasterView.emptyStateReasonImage.image = currentEmptyStateImage
		}
	}
	var imagesDataSource: [String] = []
	var searchHistoryDataSource: [String] = []
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
		
		imageSearchMasterView.searchHistoryTableView.dataSource = self
		imageSearchMasterView.searchHistoryTableView.delegate = self
		
		imageSearchMasterView.searchBar.delegate = self
		imageSearchMasterView.searchBar.placeholder = "Search for images..."
		
		navigationItem.backButtonTitle = ""
		updateNavigationTitle(searchTerm: "")
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		imageSearchMasterView.collectionView.collectionViewLayout.invalidateLayout()
	}
	
	func updateNavigationTitle(searchTerm: String) {
		if (searchTerm.trimmingCharacters(in: .whitespacesAndNewlines) == "") {
			navigationItem.title = "Fotopedia"
		} else {
			navigationItem.title = "#\(searchTerm)"
		}
	}
}

// MARK: - ImageSearchMasterViewControllerProtocol
extension ImageSearchMasterViewController: ImageSearchMasterViewControllerProtocol {
	func updateImagesDataSource(newDataSource: [String]) {
		self.imagesDataSource = newDataSource
		self.imageSearchMasterView.collectionView.reloadData()
	}
	
	func updateEmptyStateView(emptyStateReason: String, emptyStateImage: UIImage) {
		self.currentEmptyStateReason = emptyStateReason
		self.currentEmptyStateImage = emptyStateImage
	}
	
	func updateLayoutState(newState: ImageListState) {
		self.currentImageListState = newState
	}
	
	func updateSearchHistoryList(searchHistory: [String]) {
		self.searchHistoryDataSource = searchHistory
		self.imageSearchMasterView.searchHistoryTableView.reloadData()
	}
}

// MARK: - UISearchBarDelegate
extension ImageSearchMasterViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		updateNavigationTitle(searchTerm: searchBar.text!)
		imageSearchMasterInteractor.didRequestCleanSearchForImages(searchTerm: searchBar.text!)
		self.imageSearchMasterView.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
	}
	
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
		if (searchHistoryDataSource.count > 0) {
			self.imageSearchMasterView.searchHistoryTableView.isHidden = false
		}
	}
	
	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
		self.imageSearchMasterView.searchHistoryTableView.isHidden = true
	}
}


// MARK: - UICollectionViewDataSource
extension ImageSearchMasterViewController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return imagesDataSource.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
		cell.imageView.kf.setImage(with: URL(string: self.imagesDataSource[indexPath.row]), placeholder: UIImage(named: "imagePlaceholder"))
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
		imageSearchMasterInteractor.didSelectImage(url: imagesDataSource[indexPath.row])
	}
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height
		if (bottomEdge >= scrollView.contentSize.height) {
			imageSearchMasterInteractor.didScrollToTheEndOfSearchResult()
		}
	}
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		guard previousTraitCollection != nil else { return }
		imageSearchMasterView.collectionView.collectionViewLayout.invalidateLayout()
		imageSearchMasterView.layoutSubviews()
	}
}

// MARK: - UITableViewDataSource
extension ImageSearchMasterViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		self.searchHistoryDataSource.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: SearchHistoryTableViewCell.reuseIdentifier, for: indexPath) as! SearchHistoryTableViewCell
		cell.textLabel?.text = self.searchHistoryDataSource[indexPath.row]
		return cell
	}
}

// MARK: - UITableViewDelegate
extension ImageSearchMasterViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let selectedSearchTerm = self.searchHistoryDataSource[indexPath.row]
		imageSearchMasterView.searchBar.text = selectedSearchTerm
		imageSearchMasterView.searchBar.resignFirstResponder()
		imageSearchMasterInteractor.didRequestCleanSearchForImages(searchTerm: selectedSearchTerm)
		updateNavigationTitle(searchTerm: selectedSearchTerm)
	}
}
