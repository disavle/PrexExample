//
//  URLConstuctor.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

final class URLConstuctor: IURLConstuctor {

	// MARK: - Hardcode user id

	static let userId = "1"

	// MARK: - IURLConstuctor

	func constructUrl<T: IRequest>(from request: T) throws -> URLRequest {
		guard var components = URLComponents(string: request.baseUrlString) else {
			throw URLConstructorError.invalidBaseUrl
		}
		components.path = request.path

		if !request.additionalParameters.isEmpty {
			components.queryItems = request.additionalParameters.map {
				URLQueryItem(name: $0.key, value: $0.value)
			}
		}

		guard let url = components.url else {
			throw URLConstructorError.urlCreationFailed
		}

		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = request.method.rawValue

		if let body = request.body {
			urlRequest.httpBody = body
		}

		urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
		urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")

		return urlRequest
	}
}

enum URLConstructorError: Error {
	case invalidBaseUrl
	case urlCreationFailed

	var localizedDescription: String {
		switch self {
		case .invalidBaseUrl:
			return "Некорретный базовый URL"
		case .urlCreationFailed:
			return "Невозможно создать URL"
		}
	}
}
