//
//  RMListCell.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import UIKit

class RMListCell: UICollectionViewCell {
	// MARK: - Internal
	static let id = "RMListCell"

	// MARK: - Private
	private lazy var viewBack: UIView = {
		let view = UIView()
		view.backgroundColor = .secondarySystemBackground
		view.layer.cornerRadius = 15
		return view
	}()

	private lazy var image: UIImageView = {
		let image = UIImageView()
		image.layer.cornerRadius = 15
		image.backgroundColor = .tertiarySystemBackground
		return image
	}()

	private lazy var title: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.textColor = .label
		label.numberOfLines = 0
		return label
	}()

	// MARK: - Internal func
	func configure(image: UIImage, text: String) {
		setupView()
		self.image.image = image
		title.text = text
	}

	// MARK: - Private func
	private func setupView() {
		setupViewBack()
		setupImage()
		setupLabel()
	}

	private func setupViewBack() {
		addSubview(viewBack)
		viewBack.snp.makeConstraints {
			$0.center.equalToSuperview()
			$0.width.equalToSuperview().dividedBy(1.1)
			$0.height.equalTo(viewBack.snp.width)
		}
	}

	private func setupImage() {
		viewBack.addSubview(image)
		image.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.top.equalToSuperview().offset(15)
			$0.width.equalToSuperview().dividedBy(1.5)
			$0.height.equalTo(image.snp.width)
		}
	}

	private func setupLabel() {
		viewBack.addSubview(title)
		title.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.bottom.equalToSuperview().offset(-10)
			$0.width.equalToSuperview().offset(-10)
		}
	}
}
