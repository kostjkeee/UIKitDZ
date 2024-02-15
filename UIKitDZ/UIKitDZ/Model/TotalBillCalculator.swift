// TotalBillCalculator.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Вычисление конечной суммы заказа
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

    enum Ingredients {
        static let milk = "Молоко"
        static let syrup = "Сироп"
        static let soyMilk = "Молоко соевое"
        static let almondMilk = "Молоко миндальное"
        static let espresso = "Эспрессо 50мл"
    }

    // MARK: - Public Properties

    var isAnyIngredientSelected = false
    var isMilkIncluded = false
    var isSyrupIncluded = false
    var isSoyMilkIncluded = false
    var isAlmondMilkIncluded = false
    var isEspressoIncluded = false
    var addedIngredientsMap: [String: String] = [:]

    // MARK: - Public Methods

    mutating func calculateTotalBill() -> Int {
        var ingredientsCurrentPrice = 0

        if isMilkIncluded {
            ingredientsCurrentPrice += Price.milk
            addedIngredientsMap[Ingredients.milk] = String(Price.milk)
            isAnyIngredientSelected = true
        } else {
            addedIngredientsMap.removeValue(forKey: Ingredients.milk)
        }
        if isSyrupIncluded {
            ingredientsCurrentPrice += Price.syrup
            addedIngredientsMap[Ingredients.syrup] = String(Price.syrup)
            isAnyIngredientSelected = true
        } else {
            addedIngredientsMap.removeValue(forKey: Ingredients.syrup)
        }
        if isSoyMilkIncluded {
            ingredientsCurrentPrice += Price.soyMilk
            addedIngredientsMap[Ingredients.soyMilk] = String(Price.soyMilk)
            isAnyIngredientSelected = true
        } else {
            addedIngredientsMap.removeValue(forKey: Ingredients.soyMilk)
        }
        if isAlmondMilkIncluded {
            ingredientsCurrentPrice += Price.almonMilk
            addedIngredientsMap[Ingredients.almondMilk] = String(Price.almonMilk)
            isAnyIngredientSelected = true
        } else {
            addedIngredientsMap.removeValue(forKey: Ingredients.almondMilk)
        }
        if isEspressoIncluded {
            ingredientsCurrentPrice += Price.espresso
            addedIngredientsMap[Ingredients.espresso] = String(Price.espresso)
            isAnyIngredientSelected = true
        } else {
            addedIngredientsMap.removeValue(forKey: Ingredients.espresso)
        }
        if ingredientsCurrentPrice == 0 {
            isAnyIngredientSelected = false
        }
        return Price.coffee + ingredientsCurrentPrice
    }
}
