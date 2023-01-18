//
//  RMListRequest.swift
//  MVP
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

struct RMListRequest: IRequest {

	typealias Model = RMList

	let baseUrlString: String = "https://rickandmortyapi.com"
	var path: String {
		"/api/character"
	}

	var pageNum: Int

	var additionalParameters: [String: String] { return ["page": pageNum.description] }

	var method: HttpMethod = .get

	var body: Data?
}
