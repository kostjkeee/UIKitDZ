// CoffeeRoastingViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol CoffeeRoastingViewControllerDelegate: AnyObject {
    func coffeeRoastingSelected(roastingDescription: String, roastingImageName: String)
}

///  Контроллер для модально всплывающего экрана с выбором обжарки
final class CoffeeRoastingViewController: UIViewController {
    // MARK: - Public Properties

    var delegate: CoffeeRoastingViewControllerDelegate?

    // MARK: - Private Properties

    private var isDarkRoastingSelected = true {
        didSet {
            if isDarkRoastingSelected {
                toggleViewLayers(isDarkRoastingSelected: true)
            } else {
                toggleViewLayers(isDarkRoastingSelected: false)
            }
        }
    }

    private lazy var cancelButton = createCancelButton(action: #selector(cancelTapped))

    private var descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 53, width: 294, height: 30))
        label.text = "Уточните обжарку зеренъ"
        label.font = UIFont(name: "Verdana-bold", size: 18)
        return label
    }()

    private var darkRoastingLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 117, width: 165, height: 34))
        label.text = "Темная \nобжарка"
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 13)
        label.numberOfLines = 0
        return label
    }()

    private var lightRoastingLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 117, width: 165, height: 34))
        label.text = "Свѣтлая \nобжарка"
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 13)
        label.numberOfLines = 0
        return label
    }()

    private lazy var darkRoastingButton = {
        let button = UIButton(frame: CGRect(x: 31, y: 17, width: 100, height: 100))
        button.tag = 0
        button.setImage(UIImage(named: "darkCoffee"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(roastingSelected), for: .touchUpInside)
        return button
    }()

    private lazy var lightRoastingButton = {
        let button = UIButton(frame: CGRect(x: 32, y: 17, width: 100, height: 100))
        button.tag = 1
        button.setImage(UIImage(named: "lightCoffee"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(roastingSelected), for: .touchUpInside)
        return button
    }()

    private lazy var darkRoastingView = createCustomView(
        xPosition: 15,
        yPosition: 102,
        width: 165,
        height: 165,
        corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner],
        color: "myGray"
    )

    private lazy var lightRoastingView = createCustomView(
        xPosition: 195,
        yPosition: 102,
        width: 165,
        height: 165,
        corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner],
        color: "myGray"
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
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

    // MARK: - Private Methods

    private func toggleViewLayers(isDarkRoastingSelected: Bool) {
        if isDarkRoastingSelected {
            lightRoastingView.layer.borderColor = nil
            lightRoastingView.layer.borderWidth = 0
            darkRoastingView.layer.borderColor = UIColor(named: "myBlue")?.cgColor
            darkRoastingView.layer.borderWidth = 1
        } else {
            darkRoastingView.layer.borderColor = nil
            darkRoastingView.layer.borderWidth = 0
            lightRoastingView.layer.borderColor = UIColor(named: "myBlue")?.cgColor
            lightRoastingView.layer.borderWidth = 1
        }
    }

    @objc private func roastingSelected(sender: UIButton) {
        if sender.tag == 0 {
            isDarkRoastingSelected = true
        } else {
            isDarkRoastingSelected = false
        }
    }

    @objc private func cancelTapped() {
        if isDarkRoastingSelected {
            delegate?.coffeeRoastingSelected(roastingDescription: "Темная \nобжарка", roastingImageName: "darkCoffee")
        } else {
            delegate?.coffeeRoastingSelected(roastingDescription: "Свѣтлая \nобжарка", roastingImageName: "lightCoffee")
        }
        dismiss(animated: true)
    }
}
