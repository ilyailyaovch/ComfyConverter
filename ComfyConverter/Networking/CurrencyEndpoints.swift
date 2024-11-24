//
//  Endpoints.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 24.11.2024.
//

import Foundation

enum CurrencyEndpoints: String {
    case checkApi = "/client/checkapi"
    case latest = "/client/latest"
    
    func path() -> String {
        return "https://api.ratesexchange.eu\(self.rawValue)"
    }
}
