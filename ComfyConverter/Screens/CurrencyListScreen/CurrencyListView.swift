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
    
    @State var chosenVal: String?
    
    var body: some View {
        NavigationStack {
            CurrencyList(viewModel.codes)
                .toolbar { EditButton() }
        }
    }
}

extension CurrencyListView {
    
    /// Список валют
    private func CurrencyList(_ vals: [String]) -> some View {
        List {
            ForEach(vals, id: \.self) { val in
                CurrencyButton(val)
                    .padding(.horizontal)
                    .swipeActions { DeleteButton(val) }
            }
            .onMove { viewModel.move(from: $0, to: $1) }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.accentSecondary.opacity(0.5))
    }

    /// Строка валюты
    private func CurrencyButton(_ val: String) -> some View {
        Button {
            viewModel.selectItem(val)
        } label: {
            CurrencyWebImage(code: val)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .buttonStyle(.plain)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    /// Кнопка изменения
    private func EditListButton() -> some View {
        Button {
    
        } label: {
            Image(systemName: "trash")
        }
        .tint(.clear)
    }

    /// Кнопка удаления
    private func DeleteButton(_ val: String) -> some View {
        Button {
            print("Delete \(val)")
        } label: {
            Image(systemName: "trash")
        }
        .tint(.clear)
    }
    
}

#Preview {
    CurrencyListView()
        .environmentObject(CurrencyListViewModel())
}
