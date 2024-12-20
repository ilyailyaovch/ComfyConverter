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
            CurrencyList()
                .toolbar { EditButton() }
        }
    }
}

extension CurrencyListView {
    
    /// Список валют
    private func CurrencyList() -> some View {
        List {
            ForEach(viewModel.currencies, id: \.symbol) { val in
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
    private func CurrencyButton(_ val: AvailableCurrency) -> some View {
        Button {
            viewModel.selectItem(val.description)
        } label: {
            HStack(alignment: .center, spacing: 16) {
                CurrencyWebImage(code: val.symbol)
                Text(val.description)
                    .foregroundStyle(.ncAccentSecondary)
                    .font(.body)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .buttonStyle(.plain)
        .padding(.horizontal)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    /// Кнопка изменения
    private func EditListButton() -> some View {
        Image(systemName: "trash")
            .tint(.clear)
    }

    /// Кнопка удаления
    private func DeleteButton(_ val: AvailableCurrency) -> some View {
        Button {
            withAnimation {
                viewModel.currencies.removeAll(where: { $0.symbol == val.symbol })
            }
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
