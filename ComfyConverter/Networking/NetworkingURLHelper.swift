//
//  NetworkingURLHelper.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 24.11.2024.
//

import Foundation

final class NetworkingURLHelper {
    
    public init() { }
    
    /// Создание строки URL с квери параметрами
    /// - query: квери параметры, которые нужно передать. Параметры могут содержать пробелы.
    /// - target: url в который вы хотите вставить исходный URL как параметр
    static func createURLWithQueryParameter(target: String, query: [String : String]) -> String? {
        // URL-адрес, в который вы хотите вставить исходный URL как параметр
        var targetURLComponents = URLComponents(string: target)
        
        var sourceURLQueryItems: [URLQueryItem] = []
        for item in query {
            let queryValue: String
            // Исходный URL, который вы хотите передать в качестве параметра
            if let sourceURL = URL(string: item.value) {
                queryValue = sourceURL.absoluteString
            } else {
                queryValue = item.value
            }
            // Создание query-параметра с исходным URL в кодировке percent-encoding
            let sourceURLQueryItem = URLQueryItem(name: item.key, value: queryValue)
            sourceURLQueryItems.append(sourceURLQueryItem)
        }
        
        // Добавление query-параметров к целевому URL
        targetURLComponents?.queryItems = sourceURLQueryItems
        
        return targetURLComponents?.url?.absoluteString
    }
    
}
