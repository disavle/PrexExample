//
//  RMDetail.swift
//  MVP
//
//  Created by Savelev Dmitriy on 18.01.2023.
//

import Foundation

// MARK: - RMDetail
struct RMDetail: Codable {
	let id: Int
	let name, status, species: String
	let gender: String
	let origin, location: Location
	let image: String
}

// MARK: - Location
struct Location: Codable {
	let name: String
}

extension RMDetail: CustomStringConvertible {
	var description: String {
		let name = "Name: \(name)"
		let status = "Status: \(status)"
		let species = "Species: \(species)"
		let gender = "Gender: \(gender)"
		let origin = "Origin: \(origin.name)"
		let location = "Location: \(location.name)"
		let sym = "\n"
		let str = name + sym + status + sym + species + sym + gender + sym + origin + sym + location
		return str
	}
}
