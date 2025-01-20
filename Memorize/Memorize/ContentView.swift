//
//  ContentView.swift
//  Memorize
//
//  Created by Malik on 1/9/25.
//

import SwiftUI

// This struct content view behaves(functionality) like a view
struct ContentView: View {
    // Alternate way of writing
    // let emojis:[String] = ["👻","🎃","🕷️","😈"]
    let emojis: Array<String> = ["👻","🎃","🕷️","😈"]
            // some View see what is being returned and ensures that it is some view
    var body: some View { // Computed Proberty
        // VStack function returns something that is a view
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        // View Modifier
        .foregroundColor(.orange)
        .padding()
    
    }
}

struct CardView: View {
    let content: String
    // @State small change
    // Temporary state
    // @ creates a pointer to memory
  @State var isFaceUp = true
    // all structs every var has to have a value
    var body: some View {
        ZStack {
            // Type Inferance
                let base = RoundedRectangle(cornerRadius:12)
                if isFaceUp {
                    base.fill(.white)
                    base.strokeBorder(lineWidth:2)
                Text(content).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius:12)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}





















#Preview {
    ContentView()
}
