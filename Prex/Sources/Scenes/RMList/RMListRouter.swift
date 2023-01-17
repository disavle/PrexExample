//
//  RMListRouter.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

final class RMListRouter: IRMListRouter {

	weak var view: RMListViewController?

	func openRMDetailScene(id: Int) {
		guard let navigationController = view?.navigationController else { return }
//		let detailAssembly = RMDetailAssembly(networkAssembly: <#NetworkAssembly#>).assembly()
//		navigationController.pushViewController(detailAssembly, animated: true)
	}
}
