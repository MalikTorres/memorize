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
        // VStack function returns something that is a view
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        // View Modifier
        .foregroundColor(.orange)
        .padding()
    
    }
}



struct CardView: View {
    var isFaceUp: Bool = false
    // all structs every var has to have a value
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius:12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius:12)
                    .strokeBorder(lineWidth:2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius:12)
            }
        })
    }
}





















#Preview {
    ContentView()
}
