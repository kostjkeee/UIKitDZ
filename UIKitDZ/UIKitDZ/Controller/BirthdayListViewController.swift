// BirthdayListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol BirthdayListViewControllerDelegate: AnyObject {
    func addPerson(name: String, daysRemainCounter: String, birthdayDate: String)
}

/// Экран, показывающий список всех зарегистрированных людей с датами их дней рождения
final class BirthdayListViewController: UIViewController {
    // MARK: - Private Properties

    private let cakeImageView: UIImageView = {
        let cake = UIImageView(frame: CGRect(x: 314, y: 119, width: 44, height: 44))
        cake.image = UIImage(named: "cake")
        return cake
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addUser)
        )
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(createImageView(yPosition: 105, imageName: "animationGirl"))
        view.addSubview(createImageView(yPosition: 200, imageName: "woman"))
        view.addSubview(createImageView(yPosition: 295, imageName: "man"))
        view.addSubview(createImageView(yPosition: 390, imageName: "boy"))
        view.addSubview(createNameLabel(yPosition: 119, labelText: "Helena Link"))
        view.addSubview(createNameLabel(yPosition: 214, labelText: "Verona Tusk"))
        view.addSubview(createNameLabel(yPosition: 309, labelText: "Alex Smith"))
        view.addSubview(createNameLabel(yPosition: 404, labelText: "Tom Johnson"))
        view.addSubview(createDateLabel(yPosition: 147, labelText: "10.03 - turns 25!"))
        view.addSubview(createDateLabel(yPosition: 242, labelText: "20.03 - turns 39"))
        view.addSubview(createDateLabel(yPosition: 337, labelText: "21.04 - turns 51"))
        view.addSubview(createDateLabel(yPosition: 432, labelText: "05.06 - turns 18"))
        view.addSubview(createDaysCounterLabel(yPosition: 214, labelText: "10 \ndays"))
        view.addSubview(createDaysCounterLabel(yPosition: 309, labelText: "42 \ndays"))
        view.addSubview(createDaysCounterLabel(yPosition: 404, labelText: "87 \ndays"))
        view.addSubview(cakeImageView)
    }

    @objc private func addUser() {
        let userDetailViewController = UserDetailViewController()
        userDetailViewController.delegate = self
        present(userDetailViewController, animated: true)
    }
}

extension BirthdayListViewController {
    func createImageView(yPosition: Int, imageName: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 20, y: yPosition, width: 75, height: 75))
        imageView.image = UIImage(named: imageName)
        return imageView
    }

    func createNameLabel(yPosition: Int, labelText: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 102, y: yPosition, width: 209, height: 20))
        label.text = labelText
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }

    func createDateLabel(yPosition: Int, labelText: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 102, y: yPosition, width: 209, height: 20))
        label.text = labelText
        label.font = UIFont(name: "Verdana", size: 14)
        return label
    }

    func createDaysCounterLabel(yPosition: Int, labelText: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 315, y: yPosition, width: 42, height: 44))
        label.text = labelText
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.textColor = .myPurple
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
}

extension BirthdayListViewController: BirthdayListViewControllerDelegate {
    func addPerson(name: String, daysRemainCounter: String, birthdayDate: String) {
        view.addSubview(createImageView(yPosition: 480, imageName: "humanTemplate"))
        view.addSubview(createNameLabel(yPosition: 492, labelText: name))
        view.addSubview(createDaysCounterLabel(yPosition: 483, labelText: daysRemainCounter))
        view.addSubview(createDateLabel(yPosition: 520, labelText: birthdayDate))
    }
}
