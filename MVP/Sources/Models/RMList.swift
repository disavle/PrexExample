//
//  Person.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

// MARK: - RMList
struct RMList: Codable {
	let results: [Results]
}

// MARK: - Result
struct Results: Codable {
	let id: Int
	let name: String
	let image: String
}
