//
//  BaseProtocols.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/19/21.
//  Copyright © 2021. All rights reserved. 
//

import Foundation
import UIKit

// MARK: - Definitions
protocol BaseInteractorProtocol: class {
	func viewDidLoad()
	func viewWillAppear(_ animated: Bool)
	func viewDidAppear(_ animated: Bool)
	func viewWillDisappear(_ animated: Bool)
	func viewDidDisappear(_ animated: Bool)
}

protocol BaseViewControllerProtocol: class {
	var viewController: BaseViewController! { get }
}

protocol BaseSplitViewControllerProtocol: class {
	var viewController: BaseViewController! { get }
}

protocol BasePresenterProtocol: class {}
protocol BaseRouterProtocol: class {}

// MARK: - Extensions
extension BaseInteractorProtocol {
	func viewDidLoad() {}
	func viewWillAppear(_ animated: Bool) {}
	func viewDidAppear(_ animated: Bool) {}
	func viewWillDisappear(_ animated: Bool) {}
	func viewDidDisappear(_ animated: Bool) {}
}

extension BaseViewControllerProtocol where Self: BaseViewController {
	var viewController: BaseViewController! {
		return self
	}
}

extension BaseSplitViewControllerProtocol where Self: BaseSplitViewController {
	var viewController: BaseSplitViewController! {
		return self
	}
}
extension BasePresenterProtocol {}
