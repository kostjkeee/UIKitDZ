// SpaceImagesTableCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Коллекция с картинками космоса
class SpaceImagesTableCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let itemsPerRow = 3
        static let itemWidth: CGFloat = 124
        static let spacing: CGFloat = 1.5
    }

    static let identifier = "SpaceImagesCell"

    // MARK: - Visual Components

    private var collectionView: UICollectionView!

    // MARK: - Private Properties

    private var spaceImagesNames: [String] = []

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    public func configure(imagesNames: [String]) {
        spaceImagesNames = imagesNames
        var numberOfRows = imagesNames.count / Constants.itemsPerRow
        if imagesNames.count % Constants.itemsPerRow != 0 {
            numberOfRows += 1
        }
        let collectiovViewHeight = (Constants.itemWidth + Constants.spacing) * CGFloat(numberOfRows)
        collectionView.heightAnchor.constraint(equalToConstant: collectiovViewHeight.rounded()).isActive = true
    }

    // MARK: - Private Methods

    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        collectionView.register(
            SpaceImagesCollectionCell.self,
            forCellWithReuseIdentifier: SpaceImagesCollectionCell.identifier
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        contentView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = Constants.spacing
        layout.minimumInteritemSpacing = Constants.spacing
        return layout
    }
}

// MARK: - SpaceImagesCell + UICollectionViewDataSource

extension SpaceImagesTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        spaceImagesNames.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SpaceImagesCollectionCell.identifier,
            for: indexPath
        ) as? SpaceImagesCollectionCell else { return UICollectionViewCell() }
        cell.spaceImageView.image = UIImage(named: spaceImagesNames[indexPath.item])
        return cell
    }
}

// MARK: - SpaceImagesCell + UICollectionViewDelegate

extension SpaceImagesTableCell: UICollectionViewDelegate {}
