//
//  Gradient.swift
//  MashGradient
//
//  Created by Ilya Ovchinnikov on 22.11.2024.
//

import SwiftUI

struct MeshGradientBorders: ViewModifier {
    
    @State
    private var appear: Bool = false
    private var animation: Animation {
        .easeInOut(duration: 1)
        .repeatForever(autoreverses: true)
    }
    
    var isActive: Bool
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        if !isActive {
            content
        } else {
            content
                .overlay {
                    MeshGradientView()
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                        .mask {
                            /// Вырез в центре
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(lineWidth: 24)
                                .blur(radius: 8)
                        }
                        .overlay {
                            /// Подсветка градиента
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(.white, lineWidth: 3)
                                .blur(radius: 3)
                                .blendMode(.overlay)
                        }
                        .overlay {
                            /// Подсветка гриницы
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(.white, lineWidth: 1)
                                .blur(radius: 1)
                                .blendMode(.overlay)
                        }
                }
        }
      
    }
    
    private func MeshGradientView() -> some View {
        MeshGradient(width: 3, height: 3, points: [
                [0, 0], appear ?  [0.5, 0] : [0.8, 0], [1, 0],
                [0, 0.5], [0.5, 0.5], [1, 0.5],
                [0, 1], appear ?  [0.5, 1] : [0.8, 1], [1, 1]
            ], colors: [
                appear ? .accentSecondary : .accentPrimary,  .purple, appear ? .indigo : .accentPrimary,
                appear ? .accentPrimary : .accentSecondary , .white, appear ? .blue : .accentPrimary,
                appear ? .yellow : .mint, .green, appear ? .mint : .accentSecondary
            ]
        )
        .onAppear {
            withAnimation(animation) {
                appear.toggle()
            }
        }
    }
        
}

extension View {
    public func meshGradientBorders(isActive: Bool, cornerRadius: CGFloat) -> some View {
        self.modifier(MeshGradientBorders(
            isActive: isActive,
            cornerRadius: cornerRadius
        ))
    }
}

#Preview {
    VStack {
        Circle()
            .frame(width: 100, height: 100)
            .meshGradientBorders(isActive: true, cornerRadius: 100)
        RoundedRectangle(cornerRadius: 16)
            .frame(width: 100, height: 100)
            .meshGradientBorders(isActive: true, cornerRadius: 16)
        Rectangle()
            .frame(width: 100, height: 100)
            .meshGradientBorders(isActive: true, cornerRadius: 0)
        RoundedRectangle(cornerRadius: 16)
            .frame(width: 200, height: 45)
            .meshGradientBorders(isActive: true, cornerRadius: 16)
    }
    
    
 
}
