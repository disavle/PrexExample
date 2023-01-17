//
//  IRMListPresenter.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation
import UIKit

protocol IRMListPresenter: AnyObject {
	func viewDidLoad()
	func getList(completion: @escaping (Result<[RMList], Error>) -> Void)
	func showNextScene(id: Int)
	func getImage(url: String, completion: @escaping (UIImage) -> Void)
}
