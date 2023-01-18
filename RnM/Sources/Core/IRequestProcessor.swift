//
//  IRequestProcessor.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

protocol IRequestProcessor: AnyObject {
	func load<T: IRequest>(_ request: T, completion: @escaping (Result<T.Model, Error>) -> Void)
}
