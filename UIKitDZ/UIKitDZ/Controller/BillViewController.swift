// BillViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью контроллер для отображения 3 экрана "Счет"
class BillViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        priceLabel
    }
    
    @IBAction func pressedTotal(_ sender: UIButton) {
    }
}
