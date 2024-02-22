// SpaceImagesCollectionCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для коллекции изображений с космосом
class SpaceImagesCollectionCell: UICollectionViewCell {
    // MARK: - Constants

    static let identifier = "SpaceImagesCollectionCell"

    // MARK: - Visual Components

    var spaceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSpaceImageView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func setupSpaceImageView() {
        contentView.addSubview(spaceImageView)
        spaceImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        spaceImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        spaceImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        spaceImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        spaceImageView.widthAnchor.constraint(equalToConstant: 124).isActive = true
        spaceImageView.heightAnchor.constraint(equalToConstant: 124).isActive = true
    }
}
