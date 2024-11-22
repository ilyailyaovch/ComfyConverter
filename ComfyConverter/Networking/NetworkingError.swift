//
//  NetworkingError.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 22.11.2024.
//

import Foundation

enum NetworkingError: LocalizedError {
    
    case badURLResponce(url: URL)
    case unknown

    var errorDescription: String? {
        switch self {
        case .badURLResponce(url: let url):
            return "[🔥🔥🔥] Bad responce from URL: \(url)"
        case .unknown:
            return "[⚠️⚠️⚠️] Unknown error occured"
        }
    }
}
