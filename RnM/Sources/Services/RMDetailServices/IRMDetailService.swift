//
//  IRMListService.swift
//  MVP
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

protocol IRMDetailService: AnyObject {
	func loadRMDetail(id: Int, completion: @escaping (Result<RMDetail, Error>) -> Void)
}
