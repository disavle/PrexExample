//
//  RMListPresenter.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import UIKit

final class RMListPresenter {

	// MARK: - Internal
	weak var view: IRMListViewController?

	// MARK: - Private
	private let router: IRMListRouter
	private var rmList: RMList?
	private let RMListService: IRMListService

	// MARK: - Lifecycle
	init(router: IRMListRouter, RMListService: IRMListService) {
		self.router = router
		self.RMListService = RMListService
	}
}

// MARK: - IRMListPresenter
extension RMListPresenter: IRMListPresenter {
	func viewDidLoad() {
		let group = DispatchGroup()
		group.enter()
		getList {[weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let response):
				self.rmList = response
			case .failure(let error):
				fatalError(String(describing: error))
			}
			group.leave()
		}
		group.notify(queue: .main) { [weak self] in
			guard let self = self else { return }
			guard let rmList = self.rmList else { return }
			self.view?.configure(model: rmList)
		}
	}

	func getList(completion: @escaping (Result<RMList, Error>) -> Void) {
		RMListService.loadRMList(completion: completion)
	}

	func showNextScene(id: Int) {
		router.openRMDetailScene(id: id)
	}

	func getImage(url: String, completion: @escaping (UIImage) -> Void) {
		DispatchQueue.global(qos: .userInteractive).async {
			if let data = try? Data(contentsOf: URL(string: url)!) {
				autoreleasepool {
					if let image = UIImage(data: data) {
						DispatchQueue.main.async {
							completion(image)
						}
					}
				}
			}
		}
	}
}
