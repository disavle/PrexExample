//
//  IRequest.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

enum HttpMethod: String {
	case get = "GET"
	case post = "POST"
	case put = "PUT"
	case delete = "DELETE"
}

protocol IRequest {
	associatedtype Model: Decodable
	var baseUrlString: String { get }
	var path: String { get }
	var additionalParameters: [String: String] { get }
	var method: HttpMethod { get }
	var body: Data? { get }
}
