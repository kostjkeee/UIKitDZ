// CoffeeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер отвечающий за отображение экрана с выбором кофе и других дополнительных добавок
final class CoffeeViewController: UIViewController {
    // MARK: - Private Properties

    private var billCalculator: TotalBillCalculator?

    private let coffee = Coffee()

    private var totalOrderMap: [String: String] = [:]

    private var isCofeeChosen = false

    private var isIngredientChosen: Bool = false {
        didSet {
            if isIngredientChosen {
                extraIngredientsButton.setImage(UIImage(named: "checkMark"), for: .normal)
            } else {
                extraIngredientsButton.setImage(UIImage(named: "plus"), for: .normal)
            }
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
        imageView.image = UIImage(named: "americano")
        return imageView
    }()

    private lazy var modificationLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 432, width: 200, height: 30))
        label.font = UIFont(name: "Verdana-bold", size: 18)
        label.text = "Модификация"
        return label
    }()

    private lazy var coffeeRoastingLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 599, width: 165, height: 34))
        label.font = UIFont(name: "Verdana", size: 13)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Темная\nобжарка"
        return label
    }()

    private lazy var extraIngredientsLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 195, y: 599, width: 165, height: 34))
        label.font = UIFont(name: "Verdana", size: 13)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Дополнительные\nингредiенты"
        return label
    }()

    private lazy var coffeeRoastingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 46, y: 499, width: 100, height: 100))
        button.setImage(UIImage(named: "darkCoffee"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(coffeeRoastingTapped), for: .touchUpInside)
        return button
    }()

    private lazy var extraIngredientsButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 262.5, y: 538.4, width: 30, height: 30))
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(extraIngredientsTapped), for: .touchUpInside)
        return button

    }()

    private lazy var billTotalPrice: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 669, width: 345, height: 30))
        label.font = UIFont(name: "Verdana-bold", size: 18)
        label.textAlignment = .right
        label.text = "Цѣна - \(TotalBillCalculator.Price.coffee) руб"
        return label
    }()

    private lazy var orderButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 717, width: 345, height: 53))
        button.setTitle("Заказать", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-bold", size: 18)
        button.layer.cornerRadius = 10
        button.backgroundColor = .myBlue
        button.addTarget(self, action: #selector(orderButtonTappeed), for: .touchUpInside)
        return button
    }()

    private lazy var activityButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.imageView?.tintColor = .black
        button.addTarget(self, action: #selector(activityTapped), for: .touchUpInside)
        return button
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.frame.size = CGSize(width: 44, height: 44)
        button.layer.cornerRadius = button.frame.width / 2
        button.backgroundColor = .myGray
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.imageView?.tintColor = .black
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
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
        let ingredients = createCustomView(
            xPosition: 195,
            yPosition: 482,
            width: 165,
            height: 165,
            corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner],
            color: "myGray"
        )
        let coffeeRoasting = createCustomView(
            xPosition: 15,
            yPosition: 482,
            width: 165,
            height: 165,
            corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner],
            color: "myGray"
        )
        let coffeeView = createCustomView(
            xPosition: 0,
            yPosition: 0,
            width: 375,
            height: 346,
            corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner],
            color: "myFlesh"
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
        view.addSubview(billTotalPrice)
    }

    private func setupNavigationButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityButton)
    }
    
    private func clearAllData() {
        totalOrderMap.removeAll()
        billTotalPrice.text = "Цѣна - \(TotalBillCalculator.Price.coffee) руб"
        isIngredientChosen = false
        coffeeSegmentedControl.selectedSegmentIndex = coffee.coffeeTypes.startIndex
        coffeeRoastingButton.setImage(UIImage(named: "darkCoffee"), for: .normal)
        billCalculator = nil
    }

    @objc private func activityTapped() {
        let activityController = UIActivityViewController(
            activityItems: ["Лови промокод roadmaplove на любой напиток из Кофейнов"],
            applicationActivities: []
        )
        present(activityController, animated: true)
    }

    @objc private func backButtonTapped() {
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

        let totalBillViewController = TotalBillViewController()
        totalBillViewController.positionsMap = totalOrderMap
        totalBillViewController.totalBill = billTotalPrice.text
        present(totalBillViewController, animated: true)
    }

    @objc private func coffeeSelected(sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            coffeeImageView.image = UIImage(named: "americano")
        case 1:
            coffeeImageView.image = UIImage(named: "cappuccino")
        case 2:
            coffeeImageView.image = UIImage(named: "latte")
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
        billTotalPrice.text = "Цѣна - \(totalBill) руб"
        totalOrderMap = ingredientsMap
    }
}
