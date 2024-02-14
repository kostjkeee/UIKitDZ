// TotalBillViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер отвечающий за показ экрана где отображается итоговая сумма заказа
class TotalBillViewController: UIViewController {
    // MARK: - Public Properties

    var positionsMap: [String: String]?
    var totalBill: String?

    // MARK: - Private Properties

    private lazy var cancelButton = createCancelButton(action: #selector(cancelTapped))

    private lazy var payButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 632, width: 345, height: 53))
        button.setTitle("Оплатить", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-bold", size: 18)
        button.backgroundColor = .myBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var leftDecoration = createDecorationImageView(
        xPosition: 20,
        yPosition: 47,
        width: 100,
        height: 72,
        imageName: "leftDecor"
    )
    private lazy var rightDecoration = createDecorationImageView(
        xPosition: 260,
        yPosition: 47,
        width: 100,
        height: 72,
        imageName: "rightDecor"
    )
    private lazy var middleDecoration = createDecorationImageView(
        xPosition: 145,
        yPosition: 538,
        width: 100,
        height: 40,
        imageName: "middleDecor"
    )
    private lazy var orderLabel = createCustomLabel(
        xPosition: 120,
        yPosition: 100,
        width: 140,
        height: 30,
        font: "Verdana-bold",
        fontSize: 18,
        color: .black,
        regularLabelText: "Вашъ Заказъ",
        attributedLabelText: nil,
        textAlignment: .center
    )
    private lazy var sumLabel = createCustomLabel(
        xPosition: 80,
        yPosition: 499,
        width: 231,
        height: 30,
        font: "Verdana-bold",
        fontSize: 18,
        color: .black,
        regularLabelText: "Цѣна - 200 руб",
        attributedLabelText: nil,
        textAlignment: .center
    )

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
                let coffee = createCustomLabel(
                    xPosition: 20,
                    yPosition: yPosition,
                    width: 150,
                    height: 30,
                    font: "Verdana-bold",
                    fontSize: 16,
                    color: .black,
                    regularLabelText: key,
                    attributedLabelText: nil,
                    textAlignment: .left
                )
                let coffeePrice = createCustomLabel(
                    xPosition: 225,
                    yPosition: yPosition,
                    width: 130,
                    height: 30,
                    font: "Verdana-bold",
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
                let regularIngredient = createCustomLabel(
                    xPosition: 20,
                    yPosition: yPosition,
                    width: 150,
                    height: 30,
                    font: "Verdana",
                    fontSize: 16,
                    color: .black,
                    regularLabelText: key,
                    attributedLabelText: nil,
                    textAlignment: .left
                )
                let regularPrice = createCustomLabel(
                    xPosition: 225,
                    yPosition: yPosition,
                    width: 130,
                    height: 30,
                    font: "Verdana",
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
        dismiss(animated: true)
    }

    @objc private func payButtonTapped() {
        print("Перейти на экран с вводом смс")
    }
}
