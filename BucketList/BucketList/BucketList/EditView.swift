//
//  EditView.swift
//  BucketList
//
//  Created by Sagar Kadam on 03/09/22.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    var onSave: (Location) -> Void
    /*
    var location: Location
    @State private var name: String
    @State private var description: String
    
    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]() */
    
    @StateObject private var viewModel : ViewModel
    
    enum LoadingState {
        case loading, loaded, failed
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place Name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby...") {
                    switch viewModel.loadingState {
                    case .loading:
                        Text("Loading..")
                    case .loaded:
                        ForEach(viewModel.pages, id:\.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later..")
                    }
                  }
            }
            .navigationTitle("Place Details")
            .toolbar {
                Button("Save") {
                    var newLocation = viewModel.location
                    newLocation.id = UUID()
                    newLocation.name = viewModel.name
                    newLocation.description = viewModel.description
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearByPlaces()
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        /*
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)*/
        
        _viewModel = StateObject(wrappedValue: (ViewModel(location: location)))
        self.onSave = onSave

    }
    
    /*
    func fetchNearByPlaces() async {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.coordinate.latitude)%7C\(location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            pages = items.query.pages.values.sorted()
            loadingState = .loaded
        } catch {
            loadingState = .failed
        }

        
        
    } */
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: Location.example) { newLocation in
        }
    }
}
