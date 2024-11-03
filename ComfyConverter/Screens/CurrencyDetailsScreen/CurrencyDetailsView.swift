//
//  CurrencyDetailsScreen.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 08.06.2024.
//

import SwiftUI

struct CurrencyDetailsView: View {
    
    @EnvironmentObject
    var viewModel: CurrencyDetailsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("CurrencyDetailsView with \(viewModel.value)")
                Button {
                    viewModel.forvardAction()
                } label: {
                    Text("Go to CurrencyDetailsView_2")
                }
            }
            .backgroundColor(.accentPrimary)
            .navigationTitle("CurrencyDetailsView")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: BackButton)
        }
    }
}

extension CurrencyDetailsView {
    
    private var BackButton: some View {
        Button {
            viewModel.backAction()
        } label: {
            Text("Back")
        }
    }

}

#Preview {
    CurrencyDetailsView()
        .environmentObject(CurrencyDetailsViewModel(val: ""))
}
