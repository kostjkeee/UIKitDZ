// PickerTextField.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

typealias PickerTextFieldDisplayNameHandler = (Any) -> String
typealias PickerTextFieldItemsSelectionHandler = (Int, Any) -> Void

/// Класс для создания кастомного text field
final class PickerTextField: UITextField {
    private let picker = UIPickerView(frame: .zero)
    private var lastSelectedRow: Int?

    var pickerData: [Any] = []
    var displayNameHandler: PickerTextFieldDisplayNameHandler?
    var itemSelectionHandler: PickerTextFieldItemsSelectionHandler?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

    private func configureView() {
        picker.delegate = self
        picker.dataSource = self
        inputView = picker
    }

    private func updateText() {
        if lastSelectedRow == nil {
            lastSelectedRow = 0
        }
        if lastSelectedRow ?? 0 > pickerData.count {
            return
        }
        let data = pickerData[lastSelectedRow ?? 0]
        text = displayNameHandler?(data)
    }
}

extension PickerTextField: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let data = pickerData[row]
        return displayNameHandler?(data)
    }
}

extension PickerTextField: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lastSelectedRow = row
        updateText()
        let data = pickerData[row]
        itemSelectionHandler?(row, data)
    }
}
