//
//  ContentView.swift
//  TaskManagement
//
//  Created by Sean Veal on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.1))
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
