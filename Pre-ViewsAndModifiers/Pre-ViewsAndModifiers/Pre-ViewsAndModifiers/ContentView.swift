//
//  ContentView.swift
//  Pre-ViewsAndModifiers
//
//  Created by Sagar Kadam on 03/08/22.
//

import SwiftUI


struct LargeTitle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeTitleStyle() -> some View{
        modifier(LargeTitle())
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View{
        VStack{
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
    
}

struct WaterMark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func waterMarked(with text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct RectangleView: View {
    var text: String
    var body: some View {
        Text(text)
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
    }
}
struct ContentView: View {
    @State private var showRedContent = false
    
    let motto1 = Text("This is views")
    let motto2 = Text("been used as properties")
    
    @ViewBuilder var myOwnView : some View {
        Text("My View")
            .font(.largeTitle)
        Button("Click Me"){
        }
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                Button("Tap Me") {
                    print(type(of: self.body))
                }
                .background(.red)
                .foregroundColor(.white)
                .frame(width: 200, height: 100)
                .background(.blue)
                
                Text("Color me")
                    .padding()
                    .background(.red)
                    .padding()
                    .background(.blue)
                    .padding()
                    .background(.green)
                    .padding()
                    .background(.yellow)
                
                VStack{
                    Text("Mumbai")
                        .font(.largeTitle)
                       // .blur(radius: 50)
                    Text("Pune")
                    Text("Delhi")
                    Text("Cheenai")
                }.font(.title)
                // .blur(radius: 5)
                
                Button("Show Color Change") {
                    showRedContent.toggle()
                }.foregroundColor(showRedContent ? .red : .blue)
                
                VStack{
                    motto1
                        .font(.largeTitle)
                    motto2
                        .font(.title)
                }
                
                myOwnView
                
                VStack{
                    RectangleView(text: "Me First")
                        .foregroundColor(.white)
                    RectangleView(text: "Me Second")
                        .foregroundColor(.yellow)
                    
                    Text("Hello World with ViewModifer")
                        .modifier(Title())
                    
                    Text("Hello World with ViewModifer - titleStyle")
                        .titleStyle()
                    
                    Color.blue
                        .frame(width: 300, height: 200)
                        .waterMarked(with: "Hacking with Swift")
                    
                    Text("Text padded by 10 points on each edge.")
                           .padding(10)
                           .border(.gray)
                    Text("Unpadded text for comparison.")
                           .border(.yellow)
                    
                    
                    GridStack(rows: 4, columns: 4) { row, col in
                       // HStack {
                            Image(systemName: "\(row * 4 + col).circle")
                            Text("R\(row) C\(col)")
                      //  }
                    }
                    
                    
                   Text("This is large Text Challenge-3")
                        .largeTitleStyle()
                 }
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
