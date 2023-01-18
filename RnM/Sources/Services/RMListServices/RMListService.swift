//
//  RMListService.swift
//  MVP
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

final class RMListService: IRMListService {

	// Dependencies
	private let requestProcessor: IRequestProcessor

	init(requestProcessor: IRequestProcessor) {
		self.requestProcessor = requestProcessor
	}

	func loadRMList(pageNum: Int, completion: @escaping (Result<RMList, Error>) -> Void) {
		let request = RMListRequest(pageNum: pageNum)
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
