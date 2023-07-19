//
//  View+Extensions.swift
//  TaskManagement
//
//  Created by Sean Veal on 7/17/23.
//

import SwiftUI

/// Custom View Extensions
extension View {
    /// Custom Spacers
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    /// Checking Two Dates are the same
    func isSameDate(_ date: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date, inSameDayAs: date2)
    }
}
