//
//  ContentView.swift
//  NewGuessTheFlag
//
//  Created by Sagar Kadam on 31/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var shwoingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia","Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                }.foregroundColor(.white)
                
                ForEach(0..<3) { number in
                    Button {
                        flagTappged(number)
                    } label: {
                            Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Rectangle())
                            .shadow(color: .black, radius: 5)
                        }
                    }
                }
            }
        .alert(scoreTitle, isPresented: $shwoingScore) {
            Button("Continuee", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
        }
    
    func flagTappged(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        }else {
            scoreTitle = "Wrong"
        }
        shwoingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
