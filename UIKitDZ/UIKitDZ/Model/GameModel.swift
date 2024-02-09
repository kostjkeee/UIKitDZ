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
        var result: UserResult
        switch answer {
        case let number where number == self.answer:
            result = .correct
        case let number where number < self.answer:
            result = .more
        case let number where number > self.answer:
            result = .less
        default:
            result = .notFound
        }
        return result
    }
}
