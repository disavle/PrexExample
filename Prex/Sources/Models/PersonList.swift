//
//  Person.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

// MARK: - PeopleData
struct PeopleData: Codable {
	let info: Info
	let personList: [PersonList]
}

// MARK: - Info
struct Info: Codable {
	let count, pages: Int
	let next: String
	let prev: String
}

// MARK: - PersonList
struct PersonList: Codable {
	let id: Int
	let name: String
	let status: Status
	let species: Species
	let type: String
	let gender: Gender
	let origin, location: Location
	let image: String
	let episode: [String]
	let url: String
	let created: String
}

enum Gender: String, Codable {
	case female = "Female"
	case male = "Male"
	case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
	let name: String
	let url: String
}

enum Species: String, Codable {
	case alien = "Alien"
	case human = "Human"
}

enum Status: String, Codable {
	case alive = "Alive"
	case dead = "Dead"
	case unknown = "unknown"
}
