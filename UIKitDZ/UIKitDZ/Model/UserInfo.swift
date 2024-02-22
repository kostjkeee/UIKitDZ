// UserInfo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные для ячейки с профилем
struct UserInfo {
    /// Имя изображения аватарки
    var avatarImageName: String
    /// Имя пользователя
    var username: String
    /// Количество публикаций
    var postsCount: String
    /// Количество подписчиков
    var subscribersCount: String
    /// Количество подписок на других пользователей
    var subscriptionsCount: String
    /// Профессия(род деятельности)  пользователя
    var occupation: String
    /// Cсылка от пользователя
    var url: String
}
