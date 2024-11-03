//
//  WebImage.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 09.06.2024.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct CurrencyWebImage: View {
    
    let code: String
    
    let urlAdress: String
    
    init(code: String) {
        self.code = code.dropLast().uppercased()
        self.urlAdress = "https://flagsapi.com/\(self.code)/flat/64.png"
    }
    
    var body: some View {
        WebImage(url: URL(string: urlAdress))
            .resizable()
            .indicator(.activity)
            .transition(.fade)
            .scaledToFit()
            .frame(width: 50, height: 50)
    }
}

#Preview {
    CurrencyWebImage(code: "gbp")
}
