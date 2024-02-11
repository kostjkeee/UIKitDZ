// String+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Расширение для валидации строки
public extension String {
    /// Имеет ли строка корректный символ
    var hasValidCharacter: Bool {
        range(of: "[A-Z0-9a-za-яА-ЯёË._%+-]+", options: .regularExpression) != nil
    }

    var hasSpaces: Bool {
        if contains(" ") {
            return true
        } else {
            return false
        }
    }
}
