//
//  RatesExchangeService.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 24.11.2024.
//

import Foundation
import Combine

protocol _RatesExchangeService {
    func getApiStatus()
    func getAllCurrencies()
}

class RatesExchangeService: _RatesExchangeService {

    @Published var apiStatus: APIStatus? = nil
    @Published var availableCurrencies: [AvailableCurrency] = []
    
    var subscription: AnyCancellable?

    init() {
        self.getApiStatus()
        self.getAllCurrencies()
    }

    func getApiStatus() {
        let path = CurrencyEndpoints.checkApi.path()
        guard let url = URL(string: path) else { return }
        subscription = Networking.download(url: url)
            .decode(type: APIStatus.self, decoder: JSONDecoder())
            .sink(receiveCompletion: Networking.handleCompletion,
                  receiveValue: { [weak self] (value) in
                self?.apiStatus = value
                self?.subscription?.cancel()
            })
    }
    
    func getAllCurrencies() {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return }
        let path = NetworkingURLHelper.createURLWithQueryParameter(
            target: CurrencyEndpoints.currencies.path(),
            query: ["apiKey": apiKey]
        )
        guard let url = URL(string: path ?? "") else { return }
        subscription = Networking.download(url: url)
            .decode(type: [AvailableCurrency].self, decoder: JSONDecoder())
            .sink(receiveCompletion: Networking.handleCompletion,
                  receiveValue: { [weak self] (value) in
                self?.availableCurrencies = value
                self?.subscription?.cancel()
            })
    }
    
}
