// CoffeeRoastingViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Для обьявления делегата текущего класса
protocol CoffeeRoastingViewControllerDelegate: AnyObject {
    func coffeeRoastingSelected(roastingDescription: String, roastingImageName: String)
}

/// Выбор обжарки
final class CoffeeRoastingViewController: UIViewController {
    // MARK: - Public Properties

    weak var delegate: CoffeeRoastingViewControllerDelegate?

    // MARK: - Private Properties

    private var roastingSelectedImageText: String {
        isDarkRoastingSelected == true ? CoffeeViewController.Constants.darkRoastingImage : CoffeeViewController
            .Constants.lightRoastingImage
    }

    private var isDarkRoastingSelectedText: String {
        isDarkRoastingSelected == true ? CoffeeViewController.Constants.darkRoastingText : CoffeeViewController
            .Constants.lightRoastingText
    }

    private var isDarkRoastingSelected = true {
        didSet {
            isDarkRoastingSelected ? toggleViewLayers(isDarkRoastingSelected: true) :
                toggleViewLayers(isDarkRoastingSelected: false)
        }
    }

    private lazy var cancelButton = makeCancelButton(action: #selector(cancelTapped))

    private var descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 53, width: 294, height: 30))
        label.text = CoffeeViewController.Constants.roastingDetails
        label.font = UIFont(name: CoffeeViewController.Constants.verdanaBold, size: 18)
        return label
    }()

    private var darkRoastingLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 117, width: 165, height: 34))
        label.text = CoffeeViewController.Constants.darkRoastingText
        label.textAlignment = .center
        label.font = UIFont(name: CoffeeViewController.Constants.verdana, size: 13)
        label.numberOfLines = 0
        return label
    }()

    private var lightRoastingLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 117, width: 165, height: 34))
        label.text = CoffeeViewController.Constants.lightRoastingText
        label.textAlignment = .center
        label.font = UIFont(name: CoffeeViewController.Constants.verdana, size: 13)
        label.numberOfLines = 0
        return label
    }()

    private lazy var darkRoastingButton = {
        let button = UIButton(frame: CGRect(x: 31, y: 17, width: 100, height: 100))
        button.tag = 0
        button.setImage(UIImage(named: CoffeeViewController.Constants.darkRoastingImage), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(roastingSelected), for: .touchUpInside)
        return button
    }()

    private lazy var lightRoastingButton = {
        let button = UIButton(frame: CGRect(x: 32, y: 17, width: 100, height: 100))
        button.tag = 1
        button.setImage(UIImage(named: CoffeeViewController.Constants.lightRoastingImage), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(roastingSelected), for: .touchUpInside)
        return button
    }()

    private lazy var darkRoastingView = makeCustomView(
        xPosition: 15,
        yPosition: 102,
        width: 165,
        height: 165,
        corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner],
        color: CoffeeViewController.Constants.myGray
    )

    private lazy var lightRoastingView = makeCustomView(
        xPosition: 195,
        yPosition: 102,
        width: 165,
        height: 165,
        corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner],
        color: CoffeeViewController.Constants.myGray
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private Methods

    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(descriptionLabel)
        view.addSubview(darkRoastingView)
        view.addSubview(lightRoastingView)
        view.addSubview(cancelButton)
        darkRoastingView.addSubview(darkRoastingLabel)
        darkRoastingView.addSubview(darkRoastingButton)
        lightRoastingView.addSubview(lightRoastingLabel)
        lightRoastingView.addSubview(lightRoastingButton)
        toggleViewLayers(isDarkRoastingSelected: true)
    }

    private func toggleViewLayers(isDarkRoastingSelected: Bool) {
        if isDarkRoastingSelected {
            lightRoastingView.layer.borderColor = nil
            lightRoastingView.layer.borderWidth = 0
            darkRoastingView.layer.borderColor = UIColor(named: CoffeeViewController.Constants.myBlue)?.cgColor
            darkRoastingView.layer.borderWidth = 1
        } else {
            darkRoastingView.layer.borderColor = nil
            darkRoastingView.layer.borderWidth = 0
            lightRoastingView.layer.borderColor = UIColor(named: CoffeeViewController.Constants.myBlue)?.cgColor
            lightRoastingView.layer.borderWidth = 1
        }
    }

    @objc private func roastingSelected(sender: UIButton) {
        isDarkRoastingSelected = sender.tag == 0 ? true : false
    }

    @objc private func cancelTapped() {
        delegate?.coffeeRoastingSelected(
            roastingDescription: isDarkRoastingSelectedText,
            roastingImageName: roastingSelectedImageText
        )
        dismiss(animated: true)
    }
}
