//
//  CurrencyImageService.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 09.06.2024.
//

import Foundation
import SwiftUI
import Combine

import SDWebImage
import SDWebImageSwiftUI

class CurrencyImageService {

    @Published
    var image: UIImage? = nil
    
    var imageSubscription: AnyCancellable?

    init() { }

    private func downloadCoinImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        imageSubscription = Networking.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: Networking.handleCompletion,
                  receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = returnedImage
                self.imageSubscription?.cancel()
            })
    }
}
