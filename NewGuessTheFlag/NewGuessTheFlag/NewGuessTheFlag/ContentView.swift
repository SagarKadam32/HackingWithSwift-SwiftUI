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
            
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                }.foregroundColor(.white)
                
                ForEach(0..<3) { number in
                    Button {
                        flagTappged(number)
                    } label: {
                            Image(countries[number])
                            .renderingMode(.original)
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
