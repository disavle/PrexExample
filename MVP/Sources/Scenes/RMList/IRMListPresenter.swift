//
//  IRMListPresenter.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import Foundation

protocol IRMListPresenter: AnyObject {
	func viewDidLoad()
	func getList()
	func showNextScene(id: Int)
	func configureView()
}
