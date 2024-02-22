// SpaceImagesTableCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Коллекция с картинками космоса
class SpaceImagesTableCell: UITableViewCell {
    // MARK: - Constants

    static let identifier = "SpaceImagesCell"

    // MARK: - Visual Components

    private var collectionView: UICollectionView!

    // MARK: - Private Properties

    private var spaceImagesNames: [String] = []
    private let itemsPerRow: CGFloat = 3
    private let sectionInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)


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

    public func loadSpaceImagesNames(imagesNames: [String]) {
        spaceImagesNames = imagesNames
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
//        collectionView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }

    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 124, height: 124)
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    
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

extension SpaceImagesTableCell: UICollectionViewDelegate {
}
