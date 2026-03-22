import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    var gymEmojis: Array<String> = ["⚽️","⚽️","⚾️","⚾️","🏉","🏉", "🏸", "🏸","⛳️","⛳️","🤺","🤺"]
    var travelEmojis: Array<String> = ["✈️","✈️","🇪🇸","🇪🇸","🇵🇷","🇵🇷","🍣","🍣","🍜","🍜","🌊","🌊"]
    var studyEmojis: Array<String> = ["📌","📌","📚","📚","✒️","✒️","📐","📐","📒","📒","✂️","✂️"]
    
    @State var cardCount: Int = 12
    @State var isSelected = false
    @State var originalTheme: Array<String> = ["👻","🎃","🕷️","😈","💀","🕸️", "🧙", "🙀","👹","😱","☠️","🍭"]
    
    // MARK: - Body
    var body: some View {
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
        .padding()
    }
    
    // MARK: - Subviews
    var cardCountAdjusters: some View {
        HStack {
            // Space left for cardAdder/cardRemover buttons
            Spacer()
        }
    }
    
    var themeAdjusters: some View {
        HStack {
            Button(action: {
                isSelected.toggle()
                originalTheme = travelEmojis.shuffled()
            }, label: {
                VStack {
                    Image(systemName: "airplane.circle.fill")
                        .font(.system(size: 50))
                    Text("Travel")
                }
            })
            
            Spacer()
            
            Button(action: {
                isSelected.toggle()
                originalTheme = gymEmojis.shuffled()
            }, label: {
                VStack {
                    Image(systemName: "figure.run.circle.fill")
                        .font(.system(size: 50))
                    Text("Sports")
                }
            })
            
            Spacer()
            
            Button(action: {
                isSelected.toggle()
                originalTheme = studyEmojis.shuffled()
            }, label: {
                VStack {
                    Image(systemName: "pencil.tip.crop.circle.fill")
                        .font(.system(size: 50))
                    Text("Study")
                }
            })
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: originalTheme[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}

// MARK: - Helper Views
struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
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

// MARK: - Preview
#Preview {
    ContentView()
}
