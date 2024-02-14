// TotalBillCalculator.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// модель оветчающая за логинку вычисления конечной суммы заказа
struct TotalBillCalculator {
    // MARK: - Constants

    enum Price {
        static let coffee = 100
        static let milk = 50
        static let syrup = 20
        static let soyMilk = 50
        static let almonMilk = 70
        static let espresso = 50
    }

    // MARK: - Public Properties

    var isAnyIngredientSelected = false

    var addedIngredientsMap: [String: String] = [:]

    // MARK: - Public Methods

    mutating func calculateTotalBill(milk: Bool, syrup: Bool, soyMilk: Bool, almondMilk: Bool, espresso: Bool) -> Int {
        var ingredientsCurrentPrice = 0

        if milk {
            ingredientsCurrentPrice += Price.milk
            addedIngredientsMap["Молоко"] = String(Price.milk)
            isAnyIngredientSelected = true
        }
        if syrup {
            ingredientsCurrentPrice += Price.syrup
            addedIngredientsMap["Сироп"] = String(Price.syrup)
            isAnyIngredientSelected = true
        }
        if soyMilk {
            ingredientsCurrentPrice += Price.soyMilk
            addedIngredientsMap["Молоко соевое"] = String(Price.soyMilk)
            isAnyIngredientSelected = true
        }
        if almondMilk {
            ingredientsCurrentPrice += Price.almonMilk
            addedIngredientsMap["Молоко миндальное"] = String(Price.almonMilk)
            isAnyIngredientSelected = true
        }
        if espresso {
            ingredientsCurrentPrice += Price.espresso
            addedIngredientsMap["Эспрессо 50мл"] = String(Price.espresso)
            isAnyIngredientSelected = true
        }
        return Price.coffee + ingredientsCurrentPrice
    }
}
