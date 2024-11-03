//
//  BackgroundColor.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 08.06.2024.
//

import SwiftUI

struct BackgroundColor: ViewModifier {
    
    var color: Color
    
    func body(content: Content) -> some View {
        ZStack {
            color.ignoresSafeArea()
            content
        }
    }
}

extension View {
    
    func backgroundColor(_ color: Color) -> some View {
        modifier(BackgroundColor(color: color))
    }
    
}
