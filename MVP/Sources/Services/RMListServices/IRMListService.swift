//
//  IRMListService.swift
//  MVP
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

protocol IRMListService: AnyObject {
	func loadRMList(completion: @escaping (Result<RMList, Error>) -> Void)
}
