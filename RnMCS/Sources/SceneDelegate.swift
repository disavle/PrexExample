//
//  SceneDelegate.swift
//  Prex
//
//  Created by Savelev Dmitriy on 16.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		window?.windowScene = windowScene
		let networkAssembly = NetworkAssembly()
		let RMListAssembly = RMListAssembly(networkAssembly: networkAssembly)
		let viewController = RMListAssembly.assembly()
		let navCon = UINavigationController(
			rootViewController: viewController
		)
		window?.rootViewController = navCon
		window?.makeKeyAndVisible()
	}
}
