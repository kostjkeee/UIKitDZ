// RecommendNotification.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные для ячейки с предложенем подписаться на знакомых
struct RecommendNotification {
    /// Имя изображения аватарки
    var avatarImageName: String
    /// Имя пользователя
    var username: String
    /// Текст активности в уведомлениях
    var activityText: String
    /// Текст прошедшего времени с момента публикации
    var passedTimeText: String
    /// Изменять ли вид кнопки подписки
    var didUserSubscribed: Bool
}
