//
//  ContentView.swift
//  WordScramble
//
//  Created by Sagar Kadam on 07/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errrorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                            HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                            }
                    }
                }
                
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .listStyle(.grouped)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) {}
            }message: {
                Text(errrorMessage)
            }
            .toolbar{
                Button("Start Game", action: startGame)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 2  else {
            wordError(title: "'\(answer)' too short!!", message: "Word should be more than 2 letters")
            return
        }
        
        guard isWordStaringWithDifferentLetter(word: answer) else {
            wordError(title: "'\(answer)' having same letter start!", message: "Word should start with different initial letter than original word")
            
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "'\(answer)' Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "'\(answer)' not possible word", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "'\(answer)' not a recognized word", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame() {
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            }else{
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range
                                                            , startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func isWordStaringWithDifferentLetter(word: String) -> Bool {
        var rootLetters = [Character]()
        var tempLetters = [Character]()

        for letter in rootWord {
            rootLetters.append(letter)
        }
        for letter in word {
            tempLetters.append(letter)
        }
        
        if(rootLetters[0] == tempLetters[0]) {
            return false
        }
        
        return true
    }
    
    func wordError(title: String, message: String){
        errorTitle = title
        errrorMessage = message
        showingError = true
        newWord = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
