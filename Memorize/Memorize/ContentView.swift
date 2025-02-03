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
//   let originalTheme: Array<String> = ["👻","🎃","🕷️","😈","💀","🕸️", "🧙", "🙀","👹","😱","☠️","🍭"]
    
    
   var gymEmojis: Array<String> = ["⚽️","🏀","⚾️","🏐","🏉","🏓", "🏸", "🏒","⛳️","🥋","🤺","🥅"]
    
   var travelEmojis: Array<String> = ["✈️","🌎","🇪🇸","🇵🇷","🇳🇱","🥖","🍣","🌮","🍜","🥩","🌊","🍻"]
    
   var studyEmojis: Array<String> = ["📌","📝","📚","🖇️","✒️","🗄️","📐","📖","📒","🙇","✂️","📋"]
    
    
    // some View see what is being returned and ensures that it is some view
    @State var cardCount: Int = 12
    @State var isSelected = false
    @State var originalTheme: Array<String> = ["👻","🎃","🕷️","😈","💀","🕸️", "🧙", "🙀","👹","😱","☠️","🍭"]
    
    
    
    var body: some View { // Computed Proberty
        // VStack function returns something that is a view
        
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .foregroundColor(.black)
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
            .imageScale(.large)
            .font(.largeTitle)
            
            themeAdjusters
        }
        // View Modifier
        .padding()
       
    }
    
    var cardCountAdjusters: some View {
        HStack {
        //cardRemover
            Spacer()
        //cardAdder
        }
    }
    
   
    var themeAdjusters: some View {
        HStack {
     
            Button(action:{
                isSelected.toggle()
                originalTheme = travelEmojis.shuffled()
            }, label: {
                VStack {
                    Image(systemName: "airplane.circle.fill")
                        .font(.system(size:50))
                    Text("Travel")
                }
            })
                
            Spacer()
            Button(action:{
               isSelected.toggle()
                originalTheme = gymEmojis.shuffled()
            }, label:{
                VStack {
                    Image(systemName: "figure.run.circle.fill")
                        .font(.system(size:50))
                    Text("Sports")
                }
    
            })
            
            Spacer()
            Button(action: {
                isSelected.toggle()
                originalTheme = studyEmojis.shuffled()
            }, label:  {
                VStack {
                    Image(systemName: "pencil.tip.crop.circle.fill")
                        .font(.system(size:50))
                    Text("Study")
                }
              //  Image(systemName: "pencil.tip.crop.circle.fill")
                    //.font(.system(size:50))
            })
            
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum:60))]){
            ForEach(00..<cardCount, id: \.self) { index in
                CardView(content: originalTheme[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundColor(.orange)
    }

   
//    
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button(action: {
//               cardCount += offset
//        }, label: {
//           Image(systemName: symbol)
//       })
//       .disabled(cardCount + offset < 1 || cardCount + offset > gymEmojis.count)
//   }
//   
//   var cardRemover: some View {
//       cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//   }
//   
//   var cardAdder: some View {
//       cardCountAdjuster(by: +1, symbol:  "rectangle.stack.badge.plus.fill")
//   }
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
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth:2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}





















#Preview {
    ContentView()
}
