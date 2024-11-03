//
//  Ext+Bool.swift
//  ComfyConverter
//
//  Created by Ilya Ovchinnikov on 09.06.2024.
//

import SwiftUI

extension Bool {
    
    /// Animated toggle
    mutating func animatedToggle() {
        withAnimation { self.toggle() }
    }
    
    /// Animated change value
    mutating func animated(_ val: Bool) {
        withAnimation { self = val }
    }
    
}
