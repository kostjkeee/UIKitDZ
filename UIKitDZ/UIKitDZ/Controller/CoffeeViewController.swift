// CoffeeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Выбор кофе
final class CoffeeViewController: UIViewController {
    // MARK: - Constants

    public enum Constants {
        static let lightRoastingText = "Свѣтлая \nобжарка"
        static let darkRoastingText = "Темная \nобжарка"
        static let darkRoastingImage = "darkCoffee"
        static let lightRoastingImage = "lightCoffee"
        static let checkMark = "checkMark"
        static let plus = "plus"
        static let americano = "americano"
        static let latte = "latte"
        static let cappuccino = "cappuccino"
        static let modification = "Модификация"
        static let extraIngredients = "Дополнительные\nингредiенты"
        static let myGray = "myGray"
        static let myFlesh = "myFlesh"
        static let myBlue = "myBlue"
        static let promocodeText = "Лови промокод roadmaplove на любой напиток из Кофейнов"
        static let roastingDetails = "Уточните обжарку зеренъ"
        static let ingredientsChoice = "Выберите дополнительные \nингредіенты"
        static let verdana = "Verdana"
        static let verdanaBold = "Verdana-Bold"
        static let order = "Заказать"
        static let pay = "Оплатить"
        static let leftDecor = "leftDecor"
        static let rightDecor = "rightDecor"
        static let middleDecor = "middleDecor"
        static let yourOrder = "Вашъ Заказъ"
        static let regularPrice = "Цѣна - 200 руб"
    }

    // MARK: - Private Properties

    private let coffee = Coffee()

    private var billCalculator: TotalBillCalculator?

    private var totalOrderMap: [String: String] = [:]

    private var isCofeeChosen = false

    private var isIngredientChosen = false {
        didSet {
            isIngredientChosen == true ? extraIngredientsButton
                .setImage(UIImage(named: Constants.checkMark), for: .normal) : extraIngredientsButton.setImage(
                    UIImage(named: Constants.plus),
                    for: .normal
                )
        }
    }

    private lazy var coffeeSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: coffee.coffeeTypes)
        segmentedControl.frame = CGRect(x: 15, y: 368, width: 345, height: 44)
        segmentedControl.addTarget(self, action: #selector(coffeeSelected), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()

    private lazy var coffeeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 128, width: 150, height: 150))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: Constants.americano)
        return imageView
    }()

    private lazy var modificationLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 432, width: 200, height: 30))
        label.font = UIFont(name: Constants.verdanaBold, size: 18)
        label.text = Constants.modification
        return label
    }()

    private lazy var coffeeRoastingLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 599, width: 165, height: 34))
        label.font = UIFont(name: Constants.verdana, size: 13)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = Constants.darkRoastingText
        return label
    }()

    private lazy var extraIngredientsLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 195, y: 599, width: 165, height: 34))
        label.font = UIFont(name: Constants.verdana, size: 13)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = Constants.extraIngredients
        return label
    }()

    private lazy var coffeeRoastingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 46, y: 499, width: 100, height: 100))
        button.setImage(UIImage(named: Constants.darkRoastingImage), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(coffeeRoastingTapped), for: .touchUpInside)
        return button
    }()

    private lazy var extraIngredientsButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 262.5, y: 538.4, width: 30, height: 30))
        button.setImage(UIImage(named: Constants.plus), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(extraIngredientsTapped), for: .touchUpInside)
        return button

    }()

    private lazy var billTotalPriceLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 669, width: 345, height: 30))
        label.font = UIFont(name: Constants.verdanaBold, size: 18)
        label.textAlignment = .right
        label.text = "Цѣна - \(TotalBillCalculator.Price.coffee) руб"
        return label
    }()

    private lazy var orderButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 717, width: 345, height: 53))
        button.setTitle(Constants.order, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.verdanaBold, size: 18)
        button.layer.cornerRadius = 10
        button.backgroundColor = .myBlue
        button.addTarget(self, action: #selector(orderButtonTappeed), for: .touchUpInside)
        return button
    }()

    private lazy var activityViewControllerButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.imageView?.tintColor = .black
        button.addTarget(self, action: #selector(activityViewControllerTapped), for: .touchUpInside)
        return button
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.frame.size = CGSize(width: 44, height: 44)
        button.layer.cornerRadius = button.frame.width / 2
        button.backgroundColor = .myGray
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.imageView?.tintColor = .black
        button.addTarget(self, action: #selector(clearAndReturnToPreviousVC), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        setupNavigationButtons()
        let ingredients = makeCustomView(
            xPosition: 195,
            yPosition: 482,
            width: 165,
            height: 165,
            corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner],
            color: Constants.myGray
        )
        let coffeeRoasting = makeCustomView(
            xPosition: 15,
            yPosition: 482,
            width: 165,
            height: 165,
            corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner],
            color: Constants.myGray
        )
        let coffeeView = makeCustomView(
            xPosition: 0,
            yPosition: 0,
            width: 375,
            height: 346,
            corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner],
            color: Constants.myFlesh
        )
        view.addSubview(ingredients)
        view.addSubview(coffeeRoasting)
        coffeeView.addSubview(coffeeImageView)
        view.addSubview(coffeeView)
        view.addSubview(modificationLabel)
        view.addSubview(coffeeRoastingLabel)
        view.addSubview(coffeeRoastingButton)
        view.addSubview(extraIngredientsLabel)
        view.addSubview(extraIngredientsButton)
        view.addSubview(coffeeSegmentedControl)
        view.addSubview(orderButton)
        view.addSubview(billTotalPriceLabel)
    }

    private func setupNavigationButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityViewControllerButton)
    }

    private func clearAllData() {
        totalOrderMap.removeAll()
        billTotalPriceLabel.text = "Цѣна - \(TotalBillCalculator.Price.coffee) руб"
        isIngredientChosen = false
        coffeeSegmentedControl.selectedSegmentIndex = coffee.coffeeTypes.startIndex
        coffeeRoastingButton.setImage(UIImage(named: Constants.darkRoastingImage), for: .normal)
        billCalculator = nil
    }

    @objc private func activityViewControllerTapped() {
        let activityController = UIActivityViewController(
            activityItems: [Constants.promocodeText],
            applicationActivities: []
        )
        present(activityController, animated: true)
    }

    @objc private func clearAndReturnToPreviousVC() {
        clearAllData()
        navigationController?.popViewController(animated: true)
    }

    @objc private func coffeeRoastingTapped() {
        let roastingViewController = CoffeeRoastingViewController()
        roastingViewController.delegate = self
        present(roastingViewController, animated: true)
    }

    @objc private func extraIngredientsTapped() {
        let ingredientsViewController = IngredientsViewController()
        if let safeBillCalculator = billCalculator {
            ingredientsViewController.billCalculator = safeBillCalculator
        }
        ingredientsViewController.delegate = self
        present(ingredientsViewController, animated: true)
    }

    @objc private func orderButtonTappeed() {
        let currentIndex = coffeeSegmentedControl.selectedSegmentIndex
        if isCofeeChosen {
            for key in coffee.coffeeTypes where totalOrderMap[key] != nil {
                totalOrderMap.removeValue(forKey: key)
                isCofeeChosen = false
            }
        }
        totalOrderMap["\(coffee.coffeeTypes[currentIndex])"] = "\(TotalBillCalculator.Price.coffee)"
        isCofeeChosen = true

        if let safeNavVC = navigationController {
            let totalBillViewController = TotalBillViewController(navigationController: safeNavVC)
            totalBillViewController.positionsMap = totalOrderMap
            totalBillViewController.totalBill = billTotalPriceLabel.text
            present(totalBillViewController, animated: true)
        }
    }

    @objc private func coffeeSelected(sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            coffeeImageView.image = UIImage(named: Constants.americano)
        case 1:
            coffeeImageView.image = UIImage(named: Constants.cappuccino)
        case 2:
            coffeeImageView.image = UIImage(named: Constants.latte)
        default: break
        }
    }
}

// MARK: - CoffeeRoastingViewControllerDelegate

extension CoffeeViewController: CoffeeRoastingViewControllerDelegate {
    func coffeeRoastingSelected(roastingDescription: String, roastingImageName: String) {
        coffeeRoastingLabel.text = roastingDescription
        coffeeRoastingButton.setImage(UIImage(named: roastingImageName), for: .normal)
    }
}

// MARK: - IngredientsViewControllerDelegate

extension CoffeeViewController: IngredientsViewControllerDelegate {
    func ingredientsSelected(
        totalBill: Int,
        ingredientsMap: [String: String],
        isAnythingAdded: Bool,
        calculatorInstance: TotalBillCalculator
    ) {
        billCalculator = calculatorInstance
        isIngredientChosen = isAnythingAdded
        billTotalPriceLabel.text = "Цѣна - \(totalBill) руб"
        totalOrderMap = ingredientsMap
    }
}
