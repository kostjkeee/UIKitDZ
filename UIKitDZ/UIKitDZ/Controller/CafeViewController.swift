// CafeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью контроллер для отображения 2 экрана "Cafe"
final class CafeViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var fullName: UITextField!
    @IBOutlet private var guestsNumber: UITextField!
    @IBOutlet private var tableNumber: UITextField!
    @IBOutlet private var billButton: UIButton!

    // MARK: - Public Properties

    public var usernameEmail: String?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        fullName.setUnderLine()
        guestsNumber.setUnderLine()
        tableNumber.setUnderLine()
        billButton.layer.cornerRadius = 10
    }

    @IBAction func pressedBill(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Чек", style: .default, handler: { [weak self] _ in
            self?.performSegue(withIdentifier: "segueToBill", sender: self)
        }))
        present(alertController, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segueToBill" else { return }
        guard let destination = segue.destination as? BillViewController else { return }
        destination.usernameEmail = usernameEmail
    }
}
