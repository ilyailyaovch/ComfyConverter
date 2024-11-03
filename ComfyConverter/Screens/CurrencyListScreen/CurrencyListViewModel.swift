//
//  CurrencyListViewModel.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 08.06.2024.
//

import SwiftUI
import Combine

class CurrencyListViewModel: ObservableObject {
    
    let didNavigateForvard = PassthroughSubject<String, Never>()
    
    init() {}
    
    func selectItem(_ val: String) {
        didNavigateForvard.send(val)
    }
    
}
