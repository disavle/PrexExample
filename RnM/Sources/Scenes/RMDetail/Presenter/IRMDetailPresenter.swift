//
//  IRMListPresenter.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation
import UIKit

protocol IRMDetailPresenter: AnyObject {
	func viewDidLoad()
	func getDetail(completion: @escaping (Result<RMDetail, Error>) -> Void)
	func getImage(url: String, completion: @escaping (UIImage) -> Void)
}
