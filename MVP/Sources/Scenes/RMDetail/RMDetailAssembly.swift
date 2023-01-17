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

	func assembly() -> UIViewController {
//		let requestProcessor = networkAssembly.requestProcessor
//		let currency = CurrencyAPIService(requestProcessor: requestProcessor)
		let presenter = RMDetailPresenter()
		let view = RMDetailViewController(presenter: presenter)
		presenter.view = view
		return view
	}
}
