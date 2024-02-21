// NotificationStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Хранилище для массивов с готовыми ячейками
struct NotificationStorage {
    /// Массив уведомления с лайками
    var likeNotifications: [LikeNotification] = [
        .init(
            avatarImageName: "storyImage",
            username: "lavanda123",
            activityTypeText: "понравился ваш комментарий",
            commentText: "Очень красиво!",
            passedTimeText: "12ч",
            likedImageName: "image1",
            shouldAddRespond: false
        ),
        .init(
            avatarImageName: "storyImage",
            username: "lavanda123",
            activityTypeText: "упомянул(-а) вас в комментарии",
            commentText: "@rm Cпасибо!",
            passedTimeText: "12ч",
            likedImageName: "image1",
            shouldAddRespond: true
        )
    ]
    /// Массив уведомлений с рекомендациями
    var recommendNotifications: [Any] = [
        LikeNotification(
            avatarImageName: "storyImage",
            username: "lavanda123",
            activityTypeText: "понравился ваш комментарий",
            commentText: "\"Это где?\"",
            passedTimeText: "3д.",
            likedImageName: "image2",
            shouldAddRespond: false
        ),
        RecommendNotification(
            avatarImageName: "avatarImage2",
            username: "12miho",
            activityText: "появился(-ась) в RMLink. Вы можете быть знакомы",
            passedTimeText: "3д.",
            didUserSubscribed: false
        ),
        RecommendNotification(
            avatarImageName: "storyImage",
            username: "lavanda123",
            activityText: "подписался(-ась) на ваши новости",
            passedTimeText: "5д.",
            didUserSubscribed: true
        ),
        LikeNotification(
            avatarImageName: "storyImage",
            username: "lavanda123",
            activityTypeText: "понравился ваш комментарий",
            commentText: "\"Ты вернулась?\"",
            passedTimeText: "7д.",
            likedImageName: "avatarImage",
            shouldAddRespond: false
        ),
        RecommendNotification(
            avatarImageName: "guy",
            username: "markS",
            activityText: "появился(-ась) в RMLink. Вы можете быть знакомы",
            passedTimeText: "8д.",
            didUserSubscribed: false
        ),
        RecommendNotification(
            avatarImageName: "girl",
            username: "sv_neit",
            activityText: "появился(-ась) в RMLink. Вы можете быть знакомы",
            passedTimeText: "8д.",
            didUserSubscribed: false
        )
    ]
}
