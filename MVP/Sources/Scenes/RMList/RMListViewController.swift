//
//  ViewController.swift
//  Prex
//
//  Created by Savelev Dmitriy on 16.01.2023.
//

import UIKit
import SnapKit

final class RMListViewController: UICollectionViewController {

	// MARK: - Internal
	var presenter: IRMListPresenter?

	// MARK: - Private
	private var people: RMList?

	// MARK: - Lifecycle
	init(presenter: IRMListPresenter) {
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
		presenter?.viewDidLoad()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: UICollectionViewDataSource
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		guard let people = people?.results else { return .zero }
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
		guard let people = people?.results else { return cell }
		presenter?.getImage(url: people[indexPath.row].image) { image in
			cell.configure(image: image, text: people[indexPath.row].name)
		}
		return cell
	}
}

// MARK: - IRMListViewController
extension RMListViewController: IRMListViewController {
	func configure(model: RMList) {
		people = model
		collectionView.reloadData()
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RMListViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		sizeForItemAt indexPath: IndexPath
	) -> CGSize {
		return CGSize(width: (view.frame.width / 2) - 2, height: (view.frame.width / 2) - 2)
	}
}
