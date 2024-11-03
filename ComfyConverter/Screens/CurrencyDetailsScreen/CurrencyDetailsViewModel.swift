//
//  CurrenceDetailsViewModel.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 08.06.2024.
//

import SwiftUI
import Combine

class CurrencyDetailsViewModel: ObservableObject {
    
    let didNavigateBack = PassthroughSubject<Void, Never>()
    let didNavigateForvard = PassthroughSubject<Void, Never>()
    
    let value: String
    
    init(val: String) {
        self.value = val
    }
    
    func backAction() {
        didNavigateBack.send()
    }
    
    func forvardAction() {
        didNavigateForvard.send()
    }
    
}
