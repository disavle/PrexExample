//
//  RMListAssembly.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import UIKit

final class RMDetailAssembly {

	private let networkAssembly: NetworkAssembly

	init(networkAssembly: NetworkAssembly) {
		self.networkAssembly = networkAssembly
	}

	func assembly(id: Int) -> UIViewController {
		let requestProcessor = networkAssembly.requestProcessor
		let RMDetailService = RMDetailService(requestProcessor: requestProcessor)
		let presenter = RMDetailPresenter(id: id, RMDetailService: RMDetailService)
		let view = RMDetailViewController(presenter: presenter)
		presenter.view = view
		return view
	}
}
