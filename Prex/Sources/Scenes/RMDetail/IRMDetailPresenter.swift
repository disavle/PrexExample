//
//  IRMListPresenter.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

protocol IRMDetailPresenter: AnyObject {
	func viewDidLoad()
	func getItem()
	func configureView()
}
