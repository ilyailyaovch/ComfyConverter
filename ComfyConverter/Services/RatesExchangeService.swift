//
//  RatesExchangeService.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 24.11.2024.
//

import Foundation
import Combine

class RatesExchangeService {

    @Published var apiStatus: APIStatus? = nil
    
    var subscription: AnyCancellable?

    init() {
        self.getApiStatus()
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
    
}
