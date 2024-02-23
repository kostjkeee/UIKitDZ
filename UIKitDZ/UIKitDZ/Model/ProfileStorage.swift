// ProfileStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Хранилище для массивов с готовыми контентом
struct ProfileStorage {
    // MARK: - Constants

    enum Constants {
        static let avatarImageName = "girl"
        static let userName = "Мария Иванова"
        static let postsCount = "67"
        static let subscribersCount = "458"
        static let subscriptionsCount = "120"
        static let occupation = "Консультант"
        static let userUrl = "www.spacex.com"
        static let firstStoryImageName = "rocketStoryImage"
        static let secondStoryImageName = "moonStoryImage"
        static let thirdStoryImageName = "astronautStoryImage"
        static let fourthStoryImageName = "spaceStoryImage"
        static let firstStoryName = "Запуск"
        static let secondStoryName = "Луна"
        static let thirdStoryName = "Космонавт"
        static let fourthStoryName = "Космос"
        static let spaceImageName1 = "earthImage"
        static let spaceImageName2 = "rocketImage"
        static let spaceImageName3 = "earthImage2"
        static let spaceImageName4 = "rocketSetupImage"
    }

    /// Экземпляр данных пользователя
    public var userInfo = UserInfo(
        avatarImageName: Constants.avatarImageName,
        username: Constants.userName,
        postsCount: Constants.postsCount,
        subscribersCount: Constants.subscribersCount,
        subscriptionsCount: Constants.subscriptionsCount,
        occupation: Constants.occupation,
        url: Constants.userUrl
    )

    /// Массив историй
    public var stories = [
        Stories(imageName: Constants.firstStoryImageName, storyName: Constants.firstStoryName),
        Stories(imageName: Constants.secondStoryImageName, storyName: Constants.secondStoryName),
        Stories(imageName: Constants.thirdStoryImageName, storyName: Constants.thirdStoryName),
        Stories(imageName: Constants.fourthStoryImageName, storyName: Constants.fourthStoryName),
        Stories(imageName: Constants.firstStoryImageName, storyName: Constants.firstStoryName, isTapNeeded: true),
        Stories(imageName: Constants.fourthStoryImageName, storyName: Constants.fourthStoryName),
        Stories(imageName: Constants.secondStoryImageName, storyName: Constants.secondStoryName),
        Stories(imageName: Constants.thirdStoryImageName, storyName: Constants.thirdStoryName)
    ]

    /// Массив названий изображений для коллекции
    public var spaceImagesNames = [
        Constants.spaceImageName1,
        Constants.spaceImageName2,
        Constants.spaceImageName3,
        Constants.spaceImageName4,
        Constants.spaceImageName3,
        Constants.spaceImageName1,
        Constants.spaceImageName1,
        Constants.spaceImageName2,
        Constants.spaceImageName4,
        Constants.spaceImageName3,
        Constants.spaceImageName1,
        Constants.spaceImageName1,
        Constants.spaceImageName3,
        Constants.spaceImageName4,
        Constants.spaceImageName2,
        Constants.spaceImageName1
    ]
}
