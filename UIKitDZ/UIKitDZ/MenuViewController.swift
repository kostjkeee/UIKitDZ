// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  menu view controller
final class MenuViewController: UIViewController {
    // MARK: - Private Properties

    private let logoImageView = {
        let imageView = UIImageView(image: UIImage(named: "КофеиновЪ"))
        imageView.frame = CGRect(x: 100, y: 103, width: 175, height: 76)
        return imageView
    }()

    private let whiteView = {
        let view = UIView(frame: CGRect(x: 0, y: 248, width: 375, height: 564))
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()

    private let greetingLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 190, width: 185, height: 44))
        label.text = "Добро пожаловать, Гость"
        label.numberOfLines = 0
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 255.0 / 250.0, green: 255.0 / 250.0, blue: 255.0 / 250.0, alpha: 0.8)
        return label
    }()

    private let userPicImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(red: 89.0 / 250.0, green: 190.0 / 250.0, blue: 199.0 / 250.0, alpha: 1)
        imageView.frame = CGRect(x: 311, y: 190, width: 44, height: 44)
        imageView.layer.cornerRadius = 22
        return imageView
    }()

    private let nameLabel = {
        let label = UILabel(frame: CGRect(x: 311, y: 202, width: 44, height: 19))
        label.text = "Г"
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 255.0 / 250.0, green: 255.0 / 250.0, blue: 255.0 / 250.0, alpha: 0.8)
        return label
    }()

    private let locationView = {
        let view = UIView(frame: CGRect(x: 20, y: 288, width: 335, height: 70))
        view.backgroundColor = UIColor(red: 235.0 / 250.0, green: 246.0 / 250.0, blue: 247.0 / 250.0, alpha: 1.0)
        view.layer.cornerRadius = 16
        return view
    }()

    private let adressesLabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 300, width: 150, height: 15))
        label.text = "Адреса кофеен"
        label.font = UIFont(name: "Verdana", size: 12)
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()

    private let allowAccessLabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 318, width: 260, height: 30))
        label.text = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни"
        label.font = UIFont(name: "Verdana", size: 12)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 156.0 / 250.0, green: 161.0 / 250.0, blue: 168.0 / 250.0, alpha: 1.0)
        return label
    }()

    private let geoButton = {
        let button = UIButton(frame: .init(x: 310, y: 308, width: 21, height: 29))
        button.setImage(UIImage(named: "geo"), for: .normal)
        return button
    }()

    private let menuImageView = {
        let imageView = UIImageView(image: UIImage(named: "menu"))
        imageView.frame = CGRect(x: 125, y: 370, width: 125, height: 80)
        return imageView
    }()

    private let cakeButton = {
        let view = UIButton(frame: CGRect(x: 20, y: 464, width: 335, height: 80))
        view.backgroundColor = UIColor(red: 225.0 / 250.0, green: 194.0 / 250.0, blue: 160.0 / 250.0, alpha: 0.7)
        view.layer.cornerRadius = 16
        return view
    }()

    private let cakeImageView = {
        let imageView = UIImageView(image: UIImage(named: "cake"))
        imageView.frame = CGRect(x: 271, y: 469, width: 70, height: 70)
        return imageView
    }()

    private let cakeLabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 495, width: 220, height: 19))
        let defaultFontDescriptor = UIFont.systemFont(ofSize: 16).fontDescriptor
        let fontDescriptor = UIFont.systemFont(ofSize: 16).fontDescriptor.withSymbolicTraits([
            .traitBold,
            .traitItalic
        ]) ?? defaultFontDescriptor
        label.text = "Пти пате аля «РюсЪ»"
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = UIFont(descriptor: fontDescriptor, size: 0)
        return label
    }()

    private let teaButton = {
        let view = UIButton(frame: CGRect(x: 20, y: 564, width: 335, height: 80))
        view.backgroundColor = UIColor(red: 225.0 / 250.0, green: 194.0 / 250.0, blue: 160.0 / 250.0, alpha: 0.7)
        view.layer.cornerRadius = 16
        return view
    }()

    private let teaImageView = {
        let imageView = UIImageView(image: UIImage(named: "tea"))
        imageView.frame = CGRect(x: 271, y: 584, width: 70, height: 44.66)
        return imageView
    }()

    private let teaLabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 594, width: 220, height: 19))
        let defaultFontDescriptor = UIFont.systemFont(ofSize: 16).fontDescriptor
        let fontDescriptor = UIFont.systemFont(ofSize: 16).fontDescriptor.withSymbolicTraits([
            .traitBold,
            .traitItalic
        ]) ?? defaultFontDescriptor
        label.text = "Горячiя напитки"
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = UIFont(descriptor: fontDescriptor, size: 0)
        return label
    }()

    private let coffeeButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 664, width: 335, height: 80))
        button.backgroundColor = UIColor(red: 225.0 / 250.0, green: 194.0 / 250.0, blue: 160.0 / 250.0, alpha: 0.7)
        button.layer.cornerRadius = 16
        return button
    }()

    private let coffeeImageView = {
        let imageView = UIImageView(image: UIImage(named: "coffee"))
        imageView.frame = CGRect(x: 271, y: 669, width: 70, height: 70)
        return imageView
    }()

    private let coffeeLabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 694, width: 220, height: 19))
        let defaultFontDescriptor = UIFont.systemFont(ofSize: 16).fontDescriptor
        let fontDescriptor = UIFont.systemFont(ofSize: 16).fontDescriptor.withSymbolicTraits([
            .traitBold,
            .traitItalic
        ]) ?? defaultFontDescriptor
        label.text = "Кофий"
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = UIFont(descriptor: fontDescriptor, size: 0)
        return label
    }()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        coffeeButton.addTarget(self, action: #selector(coffeeTouched), for: .touchUpInside)
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = UIColor(red: 120.0 / 250.0, green: 84.0 / 250.0, blue: 49.0 / 250.0, alpha: 1.0)
        view.addSubview(logoImageView)
        view.addSubview(whiteView)
        view.addSubview(greetingLabel)
        view.addSubview(userPicImageView)
        view.addSubview(nameLabel)
        view.addSubview(locationView)
        view.addSubview(adressesLabel)
        view.addSubview(allowAccessLabel)
        view.addSubview(geoButton)
        view.addSubview(menuImageView)
        view.addSubview(cakeButton)
        view.addSubview(cakeImageView)
        view.addSubview(cakeLabel)
        view.addSubview(teaButton)
        view.addSubview(teaImageView)
        view.addSubview(teaLabel)
        view.addSubview(coffeeButton)
        view.addSubview(coffeeImageView)
        view.addSubview(coffeeLabel)
    }

    // TODO: - прикрукить дальнейшую логику
    //сейчас по нажатию на кнопку кофе происходит переход на экран кода из смс
    @objc private func coffeeTouched() {
        print("кнопка нажмакана")
        let messageVC = MessageViewController()
        messageVC.modalPresentationStyle = .fullScreen
        present(messageVC, animated: true)
    }
}
