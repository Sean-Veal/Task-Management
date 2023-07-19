//
//  OffsetKey.swift
//  TaskManagement
//
//  Created by Sean Veal on 7/18/23.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
