//
//  Endpoints.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 24.11.2024.
//

import Foundation

enum CurrencyEndpoints: String {
    case checkApi = "/client/checkapi"
    case currencies = "/client/currencies"
    
    func path(_ parameter: String? = nil) -> String {
        if let parameter {
            return "https://api.ratesexchange.eu\(self.rawValue)\(parameter)"
        } else {
            return "https://api.ratesexchange.eu\(self.rawValue)"
        }
    }
}
