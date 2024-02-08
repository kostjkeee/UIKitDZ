// ReversedWordModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// структура для логики, имеющая метод для изменения входного слова, которое ввел пользователь
struct ReversedWord {
    // MARK: - Public Methods

    public func reverseUserWord(word: String) -> String {
        let result = word.reversed()
        return String(result)
    }
}
