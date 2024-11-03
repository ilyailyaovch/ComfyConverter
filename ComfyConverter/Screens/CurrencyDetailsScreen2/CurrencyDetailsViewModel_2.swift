//
//  CurrencyDetailsViewModel_2.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 08.06.2024.
//

import SwiftUI
import Combine

class CurrencyDetailsViewModel_2: ObservableObject {
    
    let didNavigateBack = PassthroughSubject<Void, Never>()
    
    let didNavigateForvard = PassthroughSubject<Void, Never>()
    
    init() {}
    
    func backAction() {
        didNavigateBack.send()
    }
    
    func forvardAction() {
        didNavigateForvard.send()
    }
    
}
