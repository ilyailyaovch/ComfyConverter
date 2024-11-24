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
    @Published var currencies: [AvailableCurrency] = []
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
        //self.subscribeOnApiStatus()
        self.subscribeOnAvailableCurrencies()
    }
    
    // Подписка на статус работы апи
    private func subscribeOnApiStatus() {
        ratesExchangeService.$apiStatus
            .sink { [weak self] (apiStatus) in
                self?.apiStatus = apiStatus
            }
            .store(in: &cancellables)
    }
    
    // Получение статуса работы апи
    func getApiStatus() {
        ratesExchangeService.getApiStatus()
    }
    
    // Подписка на доступные валюты
    private func subscribeOnAvailableCurrencies() {
        ratesExchangeService.$availableCurrencies
            .sink { [weak self] (currencies) in
                self?.currencies = currencies
            }
            .store(in: &cancellables)
    }
    
    // Получение доступных валют апи
    func getAvailableCurrencies() {
        ratesExchangeService.getAllCurrencies()
    }
    
    // Изменение порядка списка
    func move(from source: IndexSet, to destination: Int) {
        self.currencies.move(fromOffsets: source, toOffset: destination)
    }
    
}
