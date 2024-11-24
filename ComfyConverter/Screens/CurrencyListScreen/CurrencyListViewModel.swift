//
//  CurrencyListViewModel.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 08.06.2024.
//

import SwiftUI
import Combine

class CurrencyListViewModel: ObservableObject {
    
    @Published var apiStatus: APIStatus? = nil
    @Published var codes = ["USD", "GBP", "RUB", "GEL"]
    
    let ratesExchangeService = RatesExchangeService()
    
    let didNavigateForvard = PassthroughSubject<String, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.addSubscribers()
    }
    
    func selectItem(_ val: String) {
        didNavigateForvard.send(val)
    }
    
    private func addSubscribers() {
        
    }
    
    private func subscribeOnApiStatus() {
        ratesExchangeService.$apiStatus
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (apiStatus) in
                self?.apiStatus = apiStatus
            }
            .store(in: &cancellables)
    }
    
    func getApiStatus() {
        ratesExchangeService.getApiStatus()
    }
    
    
    func move(from source: IndexSet, to destination: Int) {
        self.codes.move(fromOffsets: source, toOffset: destination)
    }
    
}
