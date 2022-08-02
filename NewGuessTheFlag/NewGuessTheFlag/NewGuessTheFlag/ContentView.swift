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
    @State private var currentScore = 0
    @State private var isWrongAnswer = false
    @State private var currentSelectedIndex = 0
    @State private var shouldRestartGame = false
    @State private var numberOfQuestionsAksed = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia","Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
                RadialGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 700)
                    .ignoresSafeArea()
                
                VStack{
                    VStack {
                        Spacer()
                        Text("Guess the Flag")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.white)
               
                        VStack(spacing: 15) {
                            VStack {
                                Text("Tap the flag of")
                                    .foregroundColor(.secondary)
                                    .font(.subheadline.weight(.heavy))
                                Text(countries[correctAnswer])
                                    .font(.largeTitle.weight(.semibold))
                            }
                            
                            ForEach(0..<3) { number in
                                Button {
                                    currentSelectedIndex = number
                                    isWrongAnswer = flagTappged(currentSelectedIndex)
                                    
                                } label: {
                                        Image(countries[number])
                                        .renderingMode(.original)
                                        .clipShape(Rectangle())
                                        .shadow(color: .black, radius: 5)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                        Spacer()
                        Spacer()
                    
                        Text("Score: \(currentScore)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    
                        Spacer()
                    }
                    .alert("Incorrect Answer!!!", isPresented: $isWrongAnswer) {
                        Button("Re-Try ?", action: askQuestion)
                    } message: {
                        Text("This is \(countries[currentSelectedIndex])'s Flag")
                    }
                }.padding()
            }
            .alert(scoreTitle, isPresented: $shwoingScore) {
                    Button("Continue", action: askQuestion)
                } message: {
                    Text("Your score is = \(currentScore)")
                }
            .alert("Maximum Game Limit Reached !!!", isPresented: $shouldRestartGame) {
                        Button("Restart Game", action: resetGame)
                    } message: {
                        Text("Your have reached maximum limit of 8 Questions & your score is = \(currentScore)")
                    }
        }
    
    
    func flagTappged(_ number: Int) -> Bool {
        var isWrongAnswer = false
        numberOfQuestionsAksed += 1
        if number == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 1
            shwoingScore = true
        }else {
            scoreTitle = "Wrong"
            currentScore -= 1
            isWrongAnswer = true
         }
        if(numberOfQuestionsAksed == 8){
            shouldRestartGame = true
        }
        return isWrongAnswer
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        currentScore = 0
        numberOfQuestionsAksed = 0
        shwoingScore = false
        isWrongAnswer = false
        shouldRestartGame = false
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}