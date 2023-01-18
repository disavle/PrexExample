//
//  RMListPresenter.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import UIKit

final class RMDetailPresenter {

	// MARK: - Internal
	weak var view: IRMDetailViewController?

	// MARK: - Private
	private let id: Int
	private var rmDetail: RMDetail?
	private let RMDetailService: IRMDetailService

	// MARK: - Lifecycle
	init(id: Int, RMDetailService: IRMDetailService) {
		self.id = id
		self.RMDetailService = RMDetailService
	}
}

// MARK: - IRMListPresenter
extension RMDetailPresenter: IRMDetailPresenter {
	func viewDidLoad() {
		let group = DispatchGroup()
		group.enter()
		getDetail {[weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let response):
				self.rmDetail = response
			case .failure(let error):
				fatalError(String(describing: error))
			}
			group.leave()
		}
		group.notify(queue: .main) { [weak self] in
			guard let self = self else { return }
			guard let rmDetail = self.rmDetail else { return }
			self.view?.configure(model: rmDetail)
		}
	}

	func getDetail(completion: @escaping (Result<RMDetail, Error>) -> Void) {
		RMDetailService.loadRMDetail(id: id, completion: completion)
	}

	// swiftlint:disable force_unwrapping
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
