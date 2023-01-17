//
//  RequestProcessor.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

final class RequestProcessor: IRequestProcessor {

	private let session: URLSession
	private let requestConstructor: IURLConstuctor
	private let decoder: JSONDecoder

	init(session: URLSession = .shared, requestConstructor: IURLConstuctor, decoder: JSONDecoder = .init()) {
		self.session = session
		self.requestConstructor = requestConstructor
		self.decoder = decoder
	}

	// MARK: - IRequestProcessor

	func load<T: IRequest>(_ request: T, completion: @escaping (Result<T.Model, Error>) -> Void) {
		guard let url = try? requestConstructor.constructUrl(from: request) else {
			completion(.failure(NSError(domain: "Error", code: 0)))
			return
		}
		let task = session.dataTask(with: url) { data, _, error in
			if let error = error {
				completion(.failure(error))
				return
			}
			if let data = data {
				do {
					let object = try self.decoder.decode(T.Model.self, from: data)
					completion(.success(object))
				} catch {
					completion(.failure(error))
				}
				return
			}
			completion(.failure(NSError(domain: "Error", code: 0)))
		}
		task.resume()
	}
	func execute<T: IRequest>(_ request: T, completion: @escaping (Error?) -> Void) {
		guard let url = try? requestConstructor.constructUrl(from: request) else {
			completion(NSError(domain: "Error", code: 0))
			return
		}
		let task = session.dataTask(with: url) { _, _, error in
			completion(error)
		}
		task.resume()
	}
}
