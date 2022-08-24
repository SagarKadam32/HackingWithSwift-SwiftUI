//
//  AddBookView.swift
//  Bookworm
//
//  Created by Sagar Kadam on 24/08/22.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    @State private var shouldSaveEnabled = false
    
    let genres = ["Fantasy", "Horror", "Kids","Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    /*
                    Picker("Rating", selection: $rating) {
                        ForEach(0..<6) {
                            Text(String($0))
                        }
                    }*/
                    
                    RatingView(rating: $rating)
                    
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        
                        try? moc.save()
                        dismiss()
                        
                    }
                    .disabled(inputsValidated() == false)
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
    private func inputsValidated() -> Bool{
        if title.isEmpty || author.isEmpty || genre.isEmpty {
            return false
        }else if (title.trimmingCharacters(in: .whitespaces).count > 0 &&
                  author.trimmingCharacters(in: .whitespaces).count > 0 &&
                  genre.trimmingCharacters(in: .whitespaces).count > 0)  {
            return true
        }
        return true
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
