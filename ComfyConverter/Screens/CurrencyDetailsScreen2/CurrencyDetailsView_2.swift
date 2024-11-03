//
//  View_1.1.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 08.06.2024.
//

import SwiftUI

struct CurrencyDetailsView_2: View {
    
    @EnvironmentObject
    var viewModel: CurrencyDetailsViewModel_2
    
    var body: some View {
        NavigationView {
            VStack {
                Text("CurrencyDetailsView_2")
                Button {
                    viewModel.forvardAction()
                } label: {
                    Text("Go to CurrencyDetailsView_3")
                }
            }
            .backgroundColor(.cyan)
            .navigationTitle("CurrencyDetailsView_2")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: BackButton)
        }
    }
}

extension CurrencyDetailsView_2 {
    
    private var BackButton: some View {
        Button {
            viewModel.backAction()
        } label: {
            Text("Back")
        }
    }
    
}


#Preview {
    CurrencyDetailsView_2()
        .environmentObject(CurrencyDetailsViewModel_2())
}
