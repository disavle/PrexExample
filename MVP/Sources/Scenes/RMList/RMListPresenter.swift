//
//  RMListPresenter.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

final class RMListPresenter {

	// MARK: - Internal
	weak var view: IRMListViewController?

	// MARK: - Private
	private let router: IRMListRouter

	// MARK: - Lifecycle
	init(router: IRMListRouter) {
		self.router = router
	}
}

// MARK: - IRMListPresenter
extension RMListPresenter: IRMListPresenter {
	func viewDidLoad() {
	}

	func getList() {
	}

	func configureView() {
	}

	func showNextScene(id: Int) {
		router.openRMDetailScene(id: id)
	}
}
