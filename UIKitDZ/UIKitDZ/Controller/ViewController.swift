// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный вьюконтроллер для функционировaния нашего приложения
final class ViewController: UIViewController {
    // MARK: - Constants

    var game = Game()

    // MARK: - Private Properties

    private let backgroundImage = {
        let backgroundImage = UIImageView(frame: CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height
        ))
        backgroundImage.image = UIImage(named: "background")
        return backgroundImage
    }()

    private let usernameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 37, width: UIScreen.main.bounds.width, height: 82))
        label.backgroundColor = UIColor(red: 151 / 255, green: 203 / 255, blue: 229 / 255, alpha: 1.0)
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont(name: "Verdana-bold", size: 30)
        label.textAlignment = .center
        label.text = ""
        return label
    }()

    private let calculatorButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 132,
            y: 507,
            width: 200,
            height: 200
        ))
        button.backgroundColor = UIColor(red: 100 / 255, green: 181 / 255, blue: 130 / 255, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.setTitle("Калькулятор", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "Verdana-bold", size: 20)
        button.addTarget(nil, action: #selector(calculateTwoNumbers), for: .touchUpInside)
        return button
    }()

    private let guessTheNumberButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 85,
            y: 302,
            width: 150,
            height: 150
        ))
        button.backgroundColor = UIColor(red: 155 / 255, green: 127 / 255, blue: 181 / 255, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.titleLabel?.numberOfLines = 0
        button.setTitle("Угадай \nчисло", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "Verdana-bold", size: 20)
        button.addTarget(nil, action: #selector(playGame), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        greetTheUser()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(backgroundImage)
        view.addSubview(calculatorButton)
        view.addSubview(guessTheNumberButton)
    }

    private func greetTheUser() {
        let initialAlertController = UIAlertController(
            title: "Пожалуйста,\nпредставьтесь",
            message: nil,
            preferredStyle: .alert
        )
        initialAlertController.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }
        initialAlertController.addAction(UIAlertAction(title: "Готово", style: .default, handler: { [weak self] _ in
            guard let usernameText = initialAlertController.textFields?[0].text else { return }
            self?.usernameLabel.text = "Приветствую,\n\(usernameText)" + "!"
            self?.view.addSubview(self?.usernameLabel ?? UILabel())
        }))
        present(initialAlertController, animated: true)
    }

    private func checkUserResult(_ result: Game.UserResult?) {
        guard let safeResult = result else { return }
        switch safeResult {
        case .correct:
            let correctAlertController = UIAlertController(
                title: "Поздравляю!",
                message: "Вы угадали",
                preferredStyle: .alert
            )
            correctAlertController.addAction(UIAlertAction(title: "Ок", style: .cancel, handler: { _ in
                self.game.answer = 0
            }))
            present(correctAlertController, animated: true)
        case .less:
            let lessAlertController = UIAlertController(
                title: "Попробуйте еще раз",
                message: "Вы ввели слишком \nбольшое число",
                preferredStyle: .alert
            )
            lessAlertController.addAction(UIAlertAction(title: "Ок", style: .default, handler: { _ in
                self.playGame()
            }))
            present(lessAlertController, animated: true)
        case .more:
            let lessAlertController = UIAlertController(
                title: "Попробуйте еще раз",
                message: "Вы ввели слишком \nмаленькое число",
                preferredStyle: .alert
            )
            lessAlertController.addAction(UIAlertAction(title: "Ок", style: .default, handler: { _ in
                self.playGame()
            }))
            present(lessAlertController, animated: true)
        default:
            break
        }
    }

    @objc private func calculateTwoNumbers() {
        let calculatorAlertController = UIAlertController(
            title: "Введите ваши числа",
            message: nil,
            preferredStyle: .alert
        )
        calculatorAlertController.addTextField { textField in
            textField.placeholder = "Число 1"
        }
        calculatorAlertController.addTextField { textField in
            textField.placeholder = "Число 2"
        }
        calculatorAlertController.addAction(UIAlertAction(title: "Выбрать операцию", style: .default, handler: { _ in
            let operationsAlertController = UIAlertController(
                title: "Выберите математическую операцию",
                message: nil,
                preferredStyle: .actionSheet
            )
            operationsAlertController.addAction(UIAlertAction(title: "Сложить", style: .default) { _ in
                let result = (Double(calculatorAlertController.textFields?[0].text ?? "") ?? 0) +
                    (Double(calculatorAlertController.textFields?[1].text ?? "") ?? 0)
                let resultAlertController = UIAlertController(
                    title: "Ваш результат",
                    message: "Результат вычислений: \(result)",
                    preferredStyle: .alert
                )
                resultAlertController.addAction(UIAlertAction(title: "Отмена", style: .default))
                resultAlertController.addAction(UIAlertAction(title: "Ок", style: .cancel))
                self.present(resultAlertController, animated: true)
            })
            operationsAlertController.addAction(UIAlertAction(title: "Вычесть", style: .default) { _ in
                let result = (Double(calculatorAlertController.textFields?[0].text ?? "") ?? 0) -
                    (Double(calculatorAlertController.textFields?[1].text ?? "") ?? 0)
                let resultAlertController = UIAlertController(
                    title: "Ваш результат",
                    message: "Результат вычислений: \(result)",
                    preferredStyle: .alert
                )
                resultAlertController.addAction(UIAlertAction(title: "Отмена", style: .default))
                resultAlertController.addAction(UIAlertAction(title: "Ок", style: .cancel))
                self.present(resultAlertController, animated: true)
            })
            operationsAlertController.addAction(UIAlertAction(title: "Умножить", style: .default) { _ in
                let result = (Double(calculatorAlertController.textFields?[0].text ?? "") ?? 0) *
                    (Double(calculatorAlertController.textFields?[1].text ?? "") ?? 0)
                let resultAlertController = UIAlertController(
                    title: "Ваш результат",
                    message: "Результат вычислений: \(result)",
                    preferredStyle: .alert
                )
                resultAlertController.addAction(UIAlertAction(title: "Отмена", style: .default))
                resultAlertController.addAction(UIAlertAction(title: "Ок", style: .cancel))
                self.present(resultAlertController, animated: true)
            })
            operationsAlertController.addAction(UIAlertAction(title: "Разделить", style: .default) { _ in
                let result = (Double(calculatorAlertController.textFields?[0].text ?? "") ?? 0) /
                    (Double(calculatorAlertController.textFields?[1].text ?? "") ?? 0)
                let resultAlertController = UIAlertController(
                    title: "Ваш результат",
                    message: "Результат вычислений: \(result)",
                    preferredStyle: .alert
                )
                resultAlertController.addAction(UIAlertAction(title: "Отмена", style: .default))
                resultAlertController.addAction(UIAlertAction(title: "Ок", style: .cancel))
                self.present(resultAlertController, animated: true)
            })
            operationsAlertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
            self.present(operationsAlertController, animated: true)
        }))
        calculatorAlertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(calculatorAlertController, animated: true)
    }

    @objc private func playGame() {
        if game.answer == 0 {
            game.getRandomNumber()
        }
        let gameAlertController = UIAlertController(
            title: "Угадай число от 1 до 10",
            message: nil,
            preferredStyle: .alert
        )
        gameAlertController.addTextField { textField in
            textField.placeholder = "Введите число"
        }
        gameAlertController.addAction(UIAlertAction(title: "Ок", style: .default, handler: { [weak self] _ in
            guard let userAnswer = Int(gameAlertController.textFields?[0].text ?? "") else { return }
            let userResult = self?.game.checkUserAnswer(userAnswer)
            self?.checkUserResult(userResult)
        }))
        gameAlertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(gameAlertController, animated: true)
    }
}
