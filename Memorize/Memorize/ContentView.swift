//
//  ContentView.swift
//  Memorize
//
//  Created by Malik on 1/9/25.
//

import SwiftUI

// This struct content view behaves(functionality) like a view
struct ContentView: View {
            // some View see what is being returned and ensures that it is some view
    var body: some View { // Computed Proberty
        VStack {
            Image(systemName: "globe")
                .foregroundColor(Color.orange)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Malik")
        }
        .padding()
    }
}

























#Preview {
    ContentView()
}
