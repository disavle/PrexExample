//
//  ViewController.swift
//  Prex
//
//  Created by Savelev Dmitriy on 16.01.2023.
//

import UIKit
import SnapKit

final class RMDetailViewController: UIViewController {

	// MARK: - Internal
	var presenter: IRMDetailPresenter?

	// MARK: - Private
	private lazy var spinner: UIActivityIndicatorView = {
		let spinner = UIActivityIndicatorView(style: .large)
		view.addSubview(spinner)
		spinner.snp.makeConstraints {
			$0.center.equalToSuperview()
		}
		return spinner
	}()
	private lazy var image: UIImageView = {
		let image = UIImageView()
		image.layer.cornerRadius = 15
		image.layer.masksToBounds = true
		image.backgroundColor = .secondarySystemBackground
		return image
	}()
	private lazy var textField: UITextView = {
		let text = UITextView()
		text.isEditable = false
		text.isSelectable = true
		text.font = .systemFont(ofSize: 25, weight: .semibold)
		return text
	}()

	// MARK: - Lifecycle
	init(presenter: IRMDetailPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		navigationController?.navigationBar.prefersLargeTitles = true
		setupView()
		spinner.startAnimating()
		presenter?.viewDidLoad()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	// MARK: - Private func
	private func setupView() {
		setImage()
		setText()
	}

	private func setImage() {
		view.addSubview(image)
		image.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
			$0.width.equalToSuperview().dividedBy(1.5)
			$0.height.equalTo(image.snp.width)
		}
	}

	private func setText() {
		view.addSubview(textField)
		textField.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.top.equalTo(image.snp.bottom).offset(10)
			$0.bottom.equalToSuperview().offset(-5)
			$0.width.equalToSuperview().dividedBy(1.2)
		}
	}
}

// MARK: - IRMListViewController
extension RMDetailViewController: IRMDetailViewController {
	func configure(model: RMDetail) {
		presenter?.getImage(url: model.image) { image in
			self.image.image = image
			self.spinner.stopAnimating()
		}
		textField.text = model.description
		title = model.name
	}
}
