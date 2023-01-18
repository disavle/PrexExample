//
//  RMListService.swift
//  MVP
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

final class RMDetailService: IRMDetailService {

	// Dependencies
	private let requestProcessor: IRequestProcessor

	init(requestProcessor: IRequestProcessor) {
		self.requestProcessor = requestProcessor
	}

	func loadRMDetail(id: Int, completion: @escaping (Result<RMDetail, Error>) -> Void) {
		let request = RMDetailRequest(id: id)
		requestProcessor.load(request) { result in
			switch result {
			case .success(let resultDetails):
				completion(.success(resultDetails))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
}
