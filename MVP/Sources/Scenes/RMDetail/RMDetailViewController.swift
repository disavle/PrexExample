//
//  ViewController.swift
//  Prex
//
//  Created by Savelev Dmitriy on 16.01.2023.
//

import UIKit
import SnapKit

final class RMDetailViewController: UICollectionViewController {

	typealias People = [PersonList]

	// MARK: - Internal
	var presenter: IRMDetailPresenter?

	// MARK: - Private
	private var people: People?

	// MARK: - Lifecycle
	init(presenter: IRMDetailPresenter) {
		self.presenter = presenter
		let layout = UICollectionViewFlowLayout()
		layout.minimumLineSpacing = 1
		layout.minimumInteritemSpacing = 1
		super.init(collectionViewLayout: layout)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView.backgroundColor = .systemBackground
		self.collectionView.register(
			RMListCell.self,
			forCellWithReuseIdentifier: RMListCell.id
		)
		collectionView.showsVerticalScrollIndicator = false
		title = "Rick and Morty"
		navigationController?.navigationBar.prefersLargeTitles = true
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: UICollectionViewDataSource
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		guard let people = people else { return 10 }
		return people.count
	}

	override func collectionView(
		_ collectionView: UICollectionView,
		cellForItemAt indexPath: IndexPath
	) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: RMListCell.id,
			for: indexPath
		) as? RMListCell
		guard let cell = cell else { return collectionView.dequeueReusableCell(
			withReuseIdentifier: RMListCell.id,
			for: indexPath
		) }
		cell.configure(image: UIImage(), text: "Rick Sanchez")
		return cell
	}
}

// MARK: - IRMDetailViewController
extension RMDetailViewController: IRMDetailViewController {
	func configure(model: [PersonList]) {
		people = model
	}
}
