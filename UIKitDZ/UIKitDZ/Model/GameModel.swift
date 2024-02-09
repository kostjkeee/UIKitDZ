// GameModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Отвечает за логику игры "угадай число"
struct Game {
    enum UserResult {
        case correct
        case less
        case more
        case notFound
    }

    // MARK: - Public Properties

    public var answer = 0

    // MARK: - Public Methods

    public mutating func getRandomNumber() {
        answer = Int.random(in: 1 ... 10)
    }

    public func checkUserAnswer(_ answer: Int) -> UserResult {
        if answer == self.answer {
            return .correct
        } else if answer < self.answer {
            return .more
        } else if answer > self.answer {
            return .less
        }
        return .notFound
    }
}
