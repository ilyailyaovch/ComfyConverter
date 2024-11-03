//
//  CurrencyDetailsViewModel_3.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 08.06.2024.
//

import SwiftUI
import Combine

class CurrencyDetailsViewModel_3: ObservableObject {
    
    let didNavigateBack = PassthroughSubject<Void, Never>()
    
    init() {}
    
    func backAction() {
        didNavigateBack.send()
    }
    
}
