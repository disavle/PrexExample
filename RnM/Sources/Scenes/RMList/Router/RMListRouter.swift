//
//  RMListRouter.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import UIKit

final class RMListRouter: IRMListRouter {

	weak var view: RMListViewController?

	func openRMDetailScene(id: Int) {
//		guard let navigationController = view?.navigationController else { return }
		let detailAssembly = RMDetailAssembly(networkAssembly: NetworkAssembly()).assembly(id: id)
		view?.present(UINavigationController(rootViewController: detailAssembly), animated: true)
//		navigationController.popToViewController(detailAssembly, animated: true)
	}
}
