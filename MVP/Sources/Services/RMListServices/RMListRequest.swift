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

	var additionalParameters = ["page": String(Int.random(in: 1...42))]

	var method: HttpMethod = .get

	var body: Data?
}
