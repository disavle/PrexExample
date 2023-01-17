//
//  RMListRequest.swift
//  MVP
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

struct RMListRequest: IRequest {

	typealias Model = [RMList]

	let baseUrlString: String = "https://rickandmortyapi.com/api"
	var path: String {
		"/character"
	}

	var additionalParameters = [String: String]()

	var method: HttpMethod = .get

	var body: Data?
}
