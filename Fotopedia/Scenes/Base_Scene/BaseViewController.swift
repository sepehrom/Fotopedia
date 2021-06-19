//
//  BaseViewController.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/19/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
	// MARK: - Properties
	public var interactor: BaseInteractorProtocol!

	// MARK: - Methods
	override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	open override func loadView() {
		super.loadView()
	}

	// MARK: UIViewController Lifecycle
	open override func viewDidLoad() {
		guard interactor != nil else {
			 fatalError("Interactor must not be nil.")
		}
		super.viewDidLoad()
		interactor.viewDidLoad()
	}
	
	open override func viewWillAppear(_ animated: Bool) {
		guard interactor != nil else {
			fatalError("Interactor must not be nil.")
		}
		super.viewWillAppear(animated)
		interactor.viewWillAppear(animated)
	}

	open override func viewDidAppear(_ animated: Bool) {
		guard interactor != nil else {
			fatalError("Interactor must not be nil.")
		}
		super.viewDidAppear(animated)
		interactor.viewDidAppear(animated)
	}

	open override func viewWillDisappear(_ animated: Bool) {
		guard interactor != nil else {
			fatalError("Interactor must not be nil.")
		}
		super.viewWillDisappear(animated)
		interactor.viewWillDisappear(animated)
	}

	open override func viewDidDisappear(_ animated: Bool) {
		guard interactor != nil else {
			fatalError("Interactor must not be nil.")
		}
		super.viewDidDisappear(animated)
		interactor.viewDidDisappear(animated)
	}
}
