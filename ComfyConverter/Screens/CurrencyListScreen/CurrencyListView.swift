//
//  CurrencyListView.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 08.06.2024.
//

import SwiftUI

struct CurrencyListView: View {
    
    @EnvironmentObject
    var viewModel: CurrencyListViewModel
    
    let codes = ["GBP", "USD", "RUB", "GEL", "GYD"]
    
    var body: some View {
        CurrencyList(codes)
    }
}

extension CurrencyListView {
    
    /// Список валют
    private func CurrencyList(_ vals: [String]) -> some View {
        List {
            ForEach(codes, id: \.self) { val in
                CurrencyButton(val)
            }
            .onDelete(perform: { _ in })
        }
        .listStyle(.plain)
    }
    
    /// Строка валюты
    private func CurrencyButton(_ val: String) -> some View {
        Button {
            viewModel.selectItem(val)
        } label: {
            CurrencyWebImage(code: val)
        }
    }
    
}

#Preview {
    CurrencyListView()
        .environmentObject(CurrencyListViewModel())
}
