//
//  SceneDelegate.swift
//  Fotopedia
//
//  Created by Amir Sepehrom on 6/19/21.
//  Copyright © 2021. All rights reserved. 
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		if let windowScene = scene as? UIWindowScene {
			let window = UIWindow(windowScene: windowScene)
			
			let (imageSearchVC, _) = ImageSearchBuilder.build()
			let (imageSearchMasterVC, _) = ImageSearchMasterBuilder.build()
			let (imageSearchDetailVC, _) = ImageSearchDetailBuilder.build()
			
			imageSearchVC.setViewController(UINavigationController(rootViewController: imageSearchMasterVC), for: .primary)
			imageSearchVC.setViewController(UINavigationController(rootViewController: imageSearchDetailVC), for: .secondary)
			
			window.rootViewController = imageSearchVC
			self.window = window
			window.makeKeyAndVisible()
		}
	}
}

extension UIViewController {
	func window() -> UIWindow? {
		let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
		return sceneDelegate?.window
	}
}


