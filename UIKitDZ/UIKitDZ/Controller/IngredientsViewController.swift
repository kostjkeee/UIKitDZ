// IngredientsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol IngredientsViewControllerDelegate: AnyObject {
    func ingredientsSelected(totalBill: Int, ingredientsMap: [String: String], isAnythingAdded: Bool)
}

/// Контроллер отвечающий за показ экрана с дополнительными ингредиентами
class IngredientsViewController: UIViewController {
    // MARK: - Private Properties

    var delegate: IngredientsViewControllerDelegate?

    private var billCalculator = TotalBillCalculator()

    private var isMilkIncluded = false
    private var isSyrupIncluded = false
    private var isSoyMilkIncluded = false
    private var isAlmondMilkIncluded = false
    private var isEspressoIncluded = false

    private lazy var milkLabel = createCustomLabel(
        xPosition: 20,
        yPosition: 124,
        width: 275,
        height: 35,
        font: "Verdana",
        fontSize: 18,
        color: .red,
        regularLabelText: "Молоко",
        attributedLabelText: "50 руб",
        textAlignment: .left
    )

    private lazy var descriptionLabel = createCustomLabel(
        xPosition: 40,
        yPosition: 53,
        width: 294,
        height: 44,
        font: "Verdana-bold",
        fontSize: 18,
        color: .black,
        regularLabelText: "Выберите дополнительные \nингредіенты",
        attributedLabelText: nil,
        textAlignment: .center
    )

    private lazy var syrupLabel = createCustomLabel(
        xPosition: 20,
        yPosition: 174,
        width: 275,
        height: 35,
        font: "Verdana",
        fontSize: 18,
        color: .black,
        regularLabelText: "Сироп",
        attributedLabelText: "20 руб",
        textAlignment: .left
    )

    private lazy var soyMilkLabel = createCustomLabel(
        xPosition: 20,
        yPosition: 224,
        width: 275,
        height: 35,
        font: "Verdana",
        fontSize: 18,
        color: .black,
        regularLabelText: "Молоко соевое",
        attributedLabelText: "50 руб",
        textAlignment: .left
    )

    private lazy var almondMilkLabel = createCustomLabel(
        xPosition: 20,
        yPosition: 274,
        width: 275,
        height: 35,
        font: "Verdana",
        fontSize: 18,
        color: .black,
        regularLabelText: "Молоко миндальное",
        attributedLabelText: "70 руб",
        textAlignment: .left
    )

    private lazy var espressoLabel = createCustomLabel(
        xPosition: 20,
        yPosition: 324,
        width: 275,
        height: 35,
        font: "Verdana",
        fontSize: 18,
        color: .black,
        regularLabelText: "Эспрессо 50мл",
        attributedLabelText: "50 руб",
        textAlignment: .left
    )

    private lazy var milkSwitch = createCustomSwitch(xPosition: 301, yPosition: 124, width: 54, height: 35)
    private lazy var syrupSwitch = createCustomSwitch(xPosition: 301, yPosition: 174, width: 54, height: 35)
    private lazy var soyMilkSwitch = createCustomSwitch(xPosition: 301, yPosition: 224, width: 54, height: 35)
    private lazy var almondMilkSwitch = createCustomSwitch(xPosition: 301, yPosition: 274, width: 54, height: 35)
    private lazy var espressoSwitch = createCustomSwitch(xPosition: 301, yPosition: 324, width: 54, height: 35)

    private lazy var cancelButton = createCancelButton(action: #selector(cancelTapped))

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(descriptionLabel)
        view.addSubview(milkLabel)
        view.addSubview(syrupLabel)
        view.addSubview(soyMilkLabel)
        view.addSubview(almondMilkLabel)
        view.addSubview(espressoLabel)
        view.addSubview(milkSwitch)
        view.addSubview(syrupSwitch)
        view.addSubview(soyMilkSwitch)
        view.addSubview(almondMilkSwitch)
        view.addSubview(espressoSwitch)
        view.addSubview(cancelButton)
        milkSwitch.addTarget(self, action: #selector(milkTapped), for: .valueChanged)
        syrupSwitch.addTarget(self, action: #selector(syrupTapped), for: .valueChanged)
        soyMilkSwitch.addTarget(self, action: #selector(soyMilkTapped), for: .valueChanged)
        almondMilkSwitch.addTarget(self, action: #selector(almondMilkTapped), for: .valueChanged)
        espressoSwitch.addTarget(self, action: #selector(espressoTapped), for: .valueChanged)
    }

    @objc private func milkTapped(sender: UISwitch) {
        if sender.isOn {
            isMilkIncluded = true
        } else {
            isMilkIncluded = false
        }
    }

    @objc private func syrupTapped(sender: UISwitch) {
        if sender.isOn {
            isSyrupIncluded = true
        } else {
            isSyrupIncluded = false
        }
    }

    @objc private func soyMilkTapped(sender: UISwitch) {
        if sender.isOn {
            isSoyMilkIncluded = true
        } else {
            isSoyMilkIncluded = false
        }
    }

    @objc private func almondMilkTapped(sender: UISwitch) {
        if sender.isOn {
            isAlmondMilkIncluded = true
        } else {
            isAlmondMilkIncluded = false
        }
    }

    @objc private func espressoTapped(sender: UISwitch) {
        if sender.isOn {
            isEspressoIncluded = true
        } else {
            isEspressoIncluded = false
        }
    }

    @objc private func cancelTapped() {
        let bill = billCalculator.calculateTotalBill(
            milk: isMilkIncluded,
            syrup: isSyrupIncluded,
            soyMilk: isSoyMilkIncluded,
            almondMilk: isAlmondMilkIncluded,
            espresso: isEspressoIncluded
        )
        delegate?.ingredientsSelected(
            totalBill: bill,
            ingredientsMap: billCalculator.addedIngredientsMap,
            isAnythingAdded: billCalculator.isAnyIngredientSelected
        )
        dismiss(animated: true)
    }
}
