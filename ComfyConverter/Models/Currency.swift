//
//  Currency.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 09.06.2024.
//

import Foundation

// MARK: - Responce
struct CurrencyResponce: Codable {
    var data: [String: Currency]?
}

// MARK: - Currency
struct Currency: Codable {
    var symbol, name, symbolNative: String?
    var decimalDigits, rounding: Int?
    var code, namePlural: String?
    var type: TypeEnum?
    var countries: [String]?
    var iconName: String?

    enum CodingKeys: String, CodingKey {
        case symbol, name
        case symbolNative = "symbol_native"
        case decimalDigits = "decimal_digits"
        case rounding, code
        case namePlural = "name_plural"
        case type, countries
        case iconName = "icon_name"
    }
}

enum TypeEnum: String, Codable {
    case crypto = "crypto"
    case fiat = "fiat"
    case metal = "metal"
}
