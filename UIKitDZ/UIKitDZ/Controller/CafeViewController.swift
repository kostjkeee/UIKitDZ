// CafeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью контроллер для отображения 2 экрана "Cafe"
class CafeViewController: UIViewController {
    @IBOutlet var typedName: UITextField!
    @IBOutlet var typedGuestsNumber: UITextField!
    @IBOutlet var typedTableNumber: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    @IBAction func isTableReserved(_ sender: UISwitch) {}

    @IBAction func isPrepaid(_ sender: UISwitch) {}

    @IBAction func isVIProomIncluded(_ sender: UISwitch) {}

    @IBAction func pressedBill(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Чек", style: .default, handler: { [weak self] _ in
            guard let billViewController = self?.storyboard?
                .instantiateViewController(withIdentifier: "BillVC") as? BillViewController else { return }
            self?.navigationController?.pushViewController(billViewController, animated: true)
        }))
        present(alertController, animated: true)
    }
}
