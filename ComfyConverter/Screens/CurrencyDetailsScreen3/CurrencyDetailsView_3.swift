//
//  CurrenceDetailsView_3.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 08.06.2024.
//

import SwiftUI

struct CurrencyDetailsView_3: View {
    
    @EnvironmentObject
    var viewModel: CurrencyDetailsViewModel_3
    
    var body: some View {
        VStack {
            Text("CurrencyDetailsView_3")
            Button {
                viewModel.backAction()
            } label: {
                Text("Go to root view")
            }
        }
    }
}

#Preview {
    CurrencyDetailsView_3()
        .environmentObject(CurrencyDetailsViewModel_3())
}
