// NotificationStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Хранилище для массивов с готовыми ячейками
struct NotificationStorage {
    // MARK: - Constants

    enum Constants {
        static let girlWithBasketImageName = "storyImage"
        static let buildingImageName = "avatarImage"
        static let manImageName = "avatarImage2"
        static let girlImageName = "girl"
        static let userName = "lavanda123"
        static let secondUserName = "markS"
        static let thirdUserName = "sv_neit"
        static let anotherManImageName = "guy"
        static let firstActivityTypeText = "понравился ваш комментарий"
        static let secondActivityTypeText = "упомянул(-а) вас в комментарии"
        static let thirdActivityTypeText = "появился(-ась) в RMLink. Вы можете быть знакомы"
        static let fourthActivityTypeText = "подписался(-ась) на ваши новости"
        static let firstCommentText = "Очень красиво!"
        static let secondCommentText = "@rm Cпасибо!"
        static let thirdCommentText = "\"Это где?\""
        static let fourthCommentText = "\"Ты вернулась?\""
        static let firstPassedTime = "12ч"
        static let secodPassedTime = "3д."
        static let thirdPassedTime = "5д."
        static let fourthPassedTime = "7д."
        static let sixthPassedTime = "8д."
        static let firstLikedImageName = "image1"
        static let secondLikedImageName = "image2"
        static let userName2 = "12miho"
    }

    /// Массив уведомления с лайками
    var likeNotifications: [LikeNotification] = [
        .init(
            avatarImageName: Constants.girlWithBasketImageName,
            username: Constants.userName,
            activityTypeText: Constants.firstActivityTypeText,
            commentText: Constants.firstCommentText,
            passedTimeText: Constants.firstPassedTime,
            likedImageName: Constants.firstLikedImageName,
            shouldAddRespond: false
        ),
        .init(
            avatarImageName: Constants.girlWithBasketImageName,
            username: Constants.userName,
            activityTypeText: Constants.secondActivityTypeText,
            commentText: Constants.secondCommentText,
            passedTimeText: Constants.firstPassedTime,
            likedImageName: Constants.firstLikedImageName,
            shouldAddRespond: true
        )
    ]
    /// Массив уведомлений с рекомендациями
    var recommendNotifications: [Any] = [
        LikeNotification(
            avatarImageName: Constants.girlWithBasketImageName,
            username: Constants.userName,
            activityTypeText: Constants.firstActivityTypeText,
            commentText: Constants.thirdCommentText,
            passedTimeText: Constants.secodPassedTime,
            likedImageName: Constants.secondLikedImageName,
            shouldAddRespond: false
        ),
        RecommendNotification(
            avatarImageName: Constants.manImageName,
            username: Constants.userName2,
            activityText: Constants.thirdActivityTypeText,
            passedTimeText: Constants.secodPassedTime,
            didUserSubscribed: false
        ),
        RecommendNotification(
            avatarImageName: Constants.girlWithBasketImageName,
            username: Constants.userName,
            activityText: Constants.fourthActivityTypeText,
            passedTimeText: Constants.thirdPassedTime,
            didUserSubscribed: true
        ),
        LikeNotification(
            avatarImageName: Constants.girlWithBasketImageName,
            username: Constants.userName,
            activityTypeText: Constants.firstActivityTypeText,
            commentText: Constants.fourthCommentText,
            passedTimeText: Constants.fourthPassedTime,
            likedImageName: Constants.buildingImageName,
            shouldAddRespond: false
        ),
        RecommendNotification(
            avatarImageName: Constants.anotherManImageName,
            username: Constants.secondUserName,
            activityText: Constants.thirdActivityTypeText,
            passedTimeText: Constants.sixthPassedTime,
            didUserSubscribed: false
        ),
        RecommendNotification(
            avatarImageName: Constants.girlImageName,
            username: Constants.thirdUserName,
            activityText: Constants.thirdActivityTypeText,
            passedTimeText: Constants.sixthPassedTime,
            didUserSubscribed: false
        )
    ]
}
