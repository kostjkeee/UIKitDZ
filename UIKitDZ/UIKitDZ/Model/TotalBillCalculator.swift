// TotalBillCalculator.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// модель оветчающая за логинку вычисления конечной суммы заказа
struct TotalBillCalculator {
    // MARK: - Constants

    let coffeePrice = 100

    // MARK: - Public Properties

    var isAnyIngredientSelected = false

    var addedIngredientsMap: [String: String] = [:]

    // MARK: - Public Methods

    mutating func calculateTotalBill(milk: Bool, syrup: Bool, soyMilk: Bool, almondMilk: Bool, espresso: Bool) -> Int {
        var ingredientsCurrentPrice = 0

        if milk {
            ingredientsCurrentPrice += 50
            addedIngredientsMap["Молоко"] = "50"
            isAnyIngredientSelected = true
        }
        if syrup {
            ingredientsCurrentPrice += 20
            addedIngredientsMap["Сироп"] = "20"
            isAnyIngredientSelected = true
        }
        if soyMilk {
            ingredientsCurrentPrice += 50
            addedIngredientsMap["Молоко соевое"] = "50"
            isAnyIngredientSelected = true
        }
        if almondMilk {
            ingredientsCurrentPrice += 70
            addedIngredientsMap["Молоко миндальное"] = "70"
            isAnyIngredientSelected = true
        }
        if espresso {
            ingredientsCurrentPrice += 50
            addedIngredientsMap["Эспрессо 50мл"] = "50"
            isAnyIngredientSelected = true
        }
        return coffeePrice + ingredientsCurrentPrice
    }
}
