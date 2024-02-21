// LikeNotification.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные для ячейки с удведомлениями от друзей
struct LikeNotification {
    /// Имя изображения аватарки
    var avatarImageName: String
    /// Имя пользователя
    var username: String
    /// Текст активности в уведомлениях
    var activityTypeText: String
    /// Текст комментария пользователя
    var commentText: String
    /// Текст прошедшего времени с момента публикации
    var passedTimeText: String
    /// Имя понравившегося изображения
    var likedImageName: String
    /// Добавлять ли вью с ответом
    var shouldAddRespond: Bool
}
