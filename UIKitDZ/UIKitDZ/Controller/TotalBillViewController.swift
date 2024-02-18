// TotalBillViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Итоговая сумма заказа
final class TotalBillViewController: UIViewController {
    // MARK: - Public Properties

    var positionsMap: [String: String]?
    var totalBill: String?

    var presentingNavController: UINavigationController?

    // MARK: - Private Properties

    private lazy var cancelButton = makeCancelButton(action: #selector(cancelTapped))

    private lazy var payButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 632, width: 345, height: 53))
        button.setTitle(CoffeeViewController.Constants.pay, for: .normal)
        button.titleLabel?.font = UIFont(name: CoffeeViewController.Constants.verdanaBold, size: 18)
        button.backgroundColor = UIColor(named: "myBlue")
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var leftDecoration = makeDecorationImageView(
        xPosition: 20,
        yPosition: 47,
        width: 100,
        height: 72,
        imageName: CoffeeViewController.Constants.leftDecor
    )
    private lazy var rightDecoration = makeDecorationImageView(
        xPosition: 260,
        yPosition: 47,
        width: 100,
        height: 72,
        imageName: CoffeeViewController.Constants.rightDecor
    )
    private lazy var middleDecoration = makeDecorationImageView(
        xPosition: 145,
        yPosition: 538,
        width: 100,
        height: 40,
        imageName: CoffeeViewController.Constants.middleDecor
    )
    private lazy var orderLabel = makeCustomLabel(
        xPosition: 120,
        yPosition: 100,
        width: 140,
        height: 30,
        font: CoffeeViewController.Constants.verdanaBold,
        fontSize: 18,
        color: .black,
        regularLabelText: CoffeeViewController.Constants.yourOrder,
        attributedLabelText: nil,
        textAlignment: .center
    )
    private lazy var sumLabel = makeCustomLabel(
        xPosition: 80,
        yPosition: 499,
        width: 231,
        height: 30,
        font: CoffeeViewController.Constants.verdanaBold,
        fontSize: 18,
        color: .black,
        regularLabelText: CoffeeViewController.Constants.regularPrice,
        attributedLabelText: nil,
        textAlignment: .center
    )

    init(navigationController: UINavigationController) {
        super.init(nibName: nil, bundle: nil)
        presentingNavController = navigationController
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        sumLabel.text = totalBill
        view.backgroundColor = .white
        view.addSubview(leftDecoration)
        view.addSubview(rightDecoration)
        view.addSubview(middleDecoration)
        view.addSubview(orderLabel)
        view.addSubview(sumLabel)
        view.addSubview(payButton)
        view.addSubview(cancelButton)
        createOrderLabels()
    }

    private func createOrderLabels() {
        guard let items = positionsMap?.sorted(by: { $0.key < $1.key }) else { return }
        var yPosition = 155

        for (key, value) in items {
            if key == "Американо" || key == "Капучино" || key == "Латте" {
                let coffee = makeCustomLabel(
                    xPosition: 20,
                    yPosition: yPosition,
                    width: 150,
                    height: 30,
                    font: CoffeeViewController.Constants.verdanaBold,
                    fontSize: 16,
                    color: .black,
                    regularLabelText: key,
                    attributedLabelText: nil,
                    textAlignment: .left
                )
                let coffeePrice = makeCustomLabel(
                    xPosition: 225,
                    yPosition: yPosition,
                    width: 130,
                    height: 30,
                    font: CoffeeViewController.Constants.verdanaBold,
                    fontSize: 16,
                    color: .black,
                    regularLabelText: value,
                    attributedLabelText: nil,
                    textAlignment: .right
                )
                view.addSubview(coffee)
                view.addSubview(coffeePrice)
                yPosition += 35
            } else {
                let regularIngredient = makeCustomLabel(
                    xPosition: 20,
                    yPosition: yPosition,
                    width: 150,
                    height: 30,
                    font: CoffeeViewController.Constants.verdana,
                    fontSize: 16,
                    color: .black,
                    regularLabelText: key,
                    attributedLabelText: nil,
                    textAlignment: .left
                )
                let regularPrice = makeCustomLabel(
                    xPosition: 225,
                    yPosition: yPosition,
                    width: 130,
                    height: 30,
                    font: CoffeeViewController.Constants.verdana,
                    fontSize: 16,
                    color: .black,
                    regularLabelText: value,
                    attributedLabelText: nil,
                    textAlignment: .right
                )
                view.addSubview(regularIngredient)
                view.addSubview(regularPrice)
                yPosition += 35
            }
        }
    }

    @objc private func cancelTapped() {
        if let controllers = presentingNavController?.viewControllers {
            for controller in controllers {
                if let menuVC = controller as? MenuViewController {
                    dismiss(animated: true)
                    presentingNavController?.popToViewController(menuVC, animated: true)
                    break
                }
            }
        }
    }

    @objc private func payButtonTapped() {
        let messageViewController = MessageViewController()
        messageViewController.presentingNavVC = presentingNavController
        dismiss(animated: true)
        presentingNavController?.pushViewController(messageViewController, animated: true)
    }
}
