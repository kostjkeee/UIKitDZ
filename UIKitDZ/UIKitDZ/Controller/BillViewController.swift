// BillViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью контроллер для отображения 3 экрана "Счет"
class BillViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var secondSaladDescription: UILabel!
    @IBOutlet var firstSaladDescription: UILabel!
    @IBOutlet var totalButton: UIButton!

    // MARK: - Public Properties

    public var usernameEmail: String?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        secondSaladDescription.setUnderLine()
        firstSaladDescription.setUnderLine()
        totalButton.layer.cornerRadius = 10
    }

    @IBAction private func pressedTotal(_ sender: UIButton) {
        let alert = UIAlertController(title: "Вы хотите оплатить чек?", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        let okAction = UIAlertAction(title: "Да", style: .default) { _ in
            self.performSegue(withIdentifier: "segueToThank", sender: self)
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segueToThank" else { return }
        guard let destination = segue.destination as? ThankViewController,
              let safeUserEmail = usernameEmail else { return }
        destination.userEmail = safeUserEmail
    }
}
