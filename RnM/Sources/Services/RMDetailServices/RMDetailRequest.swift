//
//  RMListRequest.swift
//  MVP
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

struct RMDetailRequest: IRequest {

	typealias Model = RMDetail

	let baseUrlString: String = "https://rickandmortyapi.com"
	var path: String {
		"/api/character/\(id)"
	}

	var id: Int

	var additionalParameters = [String: String]()

	var method: HttpMethod = .get

	var body: Data?
}
