//
//  IURLConstuctor.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

protocol IURLConstuctor: AnyObject {
	func constructUrl<T: IRequest>(from request: T) throws -> URLRequest
}
