//
//  NetworkAssembly.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

final class NetworkAssembly {

	private(set) lazy var requestProcessor: IRequestProcessor = RequestProcessor(
		session: .shared,
		requestConstructor: URLConstuctor(),
		decoder: decoder
	)

	private var decoder: JSONDecoder {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .secondsSince1970
		return decoder
	}
}
