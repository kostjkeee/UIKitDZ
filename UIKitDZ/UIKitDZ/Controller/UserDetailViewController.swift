// UserDetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для заполнения данных о пользователе
class UserDetailViewController: UIViewController {
    // MARK: - Private Properties

    weak var delegate: BirthdayListViewControllerDelegate?

    private let datePicker = UIDatePicker(frame: .zero)

    private var ageData: [String] = []

    private let genderData = ["Female", "Male"]

    private let userImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 125, y: 66, width: 125, height: 125))
        imageView.image = UIImage(named: "humanTemplate")
        return imageView
    }()

    private let changePhotoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 125, y: 199, width: 125, height: 20))
        label.font = UIFont(name: "Verdana", size: 16)
        label.text = "Change photo"
        label.textColor = UIColor(red: 0 / 255, green: 122 / 255, blue: 255 / 255, alpha: 1.0)
        return label
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 325, y: 15, width: 30, height: 20))
        button.setTitle("Add", for: .normal)
        button.titleLabel?.tintColor = .black
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(UIColor(red: 0 / 255, green: 122 / 255, blue: 255 / 255, alpha: 1.0), for: .normal)
        return button
    }()

    private let cancelButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 15, width: 50, height: 20))
        button.setTitle("Cancel", for: .normal)
        button.addTarget(nil, action: #selector(cancelTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(UIColor(red: 0 / 255, green: 122 / 255, blue: 255 / 255, alpha: 1.0), for: .normal)
        return button
    }()

    private let fullNameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 336, width: 250, height: 17))
        textField.placeholder = "Typing Name Surname"
        textField.setUnderLine()
        return textField
    }()

    private lazy var birthdayTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 411, width: 250, height: 17))
        textField.tag = 0
        textField.placeholder = "Typing Date of Birth"
        textField.setUnderLine()
        textField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        return textField
    }()

    private lazy var ageTextField: UITextField = {
        let textField = PickerTextField(frame: CGRect(x: 20, y: 486, width: 250, height: 17))
        textField.tag = 1
        textField.placeholder = "Typing age"
        textField.setUnderLine()
        self.fillWithData()
        textField.pickerData = self.ageData
        textField.displayNameHandler = { item in
            (item as? String) ?? ""
        }
        return textField
    }()

    private lazy var genderTextField: UITextField = {
        let textField = PickerTextField(frame: CGRect(x: 20, y: 559, width: 250, height: 17))
        textField.tag = 2
        textField.placeholder = "Typing Gender"
        textField.setUnderLine()
        textField.pickerData = self.genderData
        textField.displayNameHandler = { item in
            (item as? String) ?? ""
        }
        return textField
    }()

    private let telegramTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 634, width: 250, height: 17))
        textField.placeholder = "Typing Telegram"
        textField.setUnderLine()
        return textField
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(userImageView)
        view.addSubview(changePhotoLabel)
        view.addSubview(addButton)
        view.addSubview(cancelButton)
        view.addSubview(createLabel(yPosition: 307, labelText: "Name Surname"))
        view.addSubview(createLabel(yPosition: 382, labelText: "Birthday"))
        view.addSubview(createLabel(yPosition: 457, labelText: "Age"))
        view.addSubview(createLabel(yPosition: 530, labelText: "Gender"))
        view.addSubview(createLabel(yPosition: 605, labelText: "Telegram"))
        view.addSubview(fullNameTextField)
        view.addSubview(birthdayTextField)
        view.addSubview(ageTextField)
        view.addSubview(genderTextField)
        view.addSubview(telegramTextField)
        createToolBar(textField: ageTextField, title: "OK", action: #selector(resignPickerView))
        createToolBar(textField: birthdayTextField, title: "Done", action: #selector(resignPickerView))
        createToolBar(textField: genderTextField, title: "OK", action: #selector(resignPickerView))
//        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        telegramTextField.delegate = self
    }

    private func fillWithData() {
        for number in 1 ... 90 {
            ageData.append(String(number))
        }
    }

    private func createToolBar(textField: UITextField, title: String, action: Selector?) {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let pickerButton = UIBarButtonItem(title: title, style: .plain, target: nil, action: action)
        toolBar.setItems([spacer, pickerButton], animated: false)
        textField.inputAccessoryView = toolBar
    }

    @objc private func resignPickerView() {
        genderTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        birthdayTextField.resignFirstResponder()
    }

    @objc private func dateSelected(sender: UIDatePicker) {
        let date = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let stringDate = dateFormatter.string(from: date)
        birthdayTextField.text = stringDate
    }

    @objc private func addButtonTapped() {
        delegate?.addPerson(
            name: fullNameTextField.text ?? "",
            daysRemainCounter: "25 \ndays",
            birthdayDate: "12.03 turns 24"
        )
        dismiss(animated: true)
    }

    @objc private func cancelTapped() {
        print("DISMISSED")
        dismiss(animated: true)
    }
}

extension UserDetailViewController {
    private func createLabel(yPosition: Int, labelText: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: yPosition, width: 175, height: 19))
        label.text = labelText
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }
}

extension UserDetailViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let alert = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Typing Telegram"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            guard let userText = alert.textFields?.first?.text else { return }
            self?.telegramTextField.text = userText
        }))
        present(alert, animated: true)
    }
}
