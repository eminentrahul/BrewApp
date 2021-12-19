//
//  ContentView.swift
//  BrewApp
//
//  Created by Rahul Ravi Prakash on 19/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var apiManager = APIManager()
    @State var searchText = ""
    let layout = [GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView (showsIndicators: false){
                
                HStack {
                    TextField("Search", text: $searchText)
                        .padding(.leading, 24)
                }
                .padding()
                .background(Color(.systemGray))
                .cornerRadius(6)
                .padding(.horizontal, 10)
                
                LazyVGrid(columns: layout, spacing: 20) {
                    
                    let sortedData = apiManager.result.sorted(by: {$0.vote_average > $1.vote_average})
                    
                    ForEach (sortedData.filter({"\($0)".contains(searchText) || searchText.isEmpty}), id: \.self) { item in
                        
                        NavigationLink(destination: DetailView(item: item)) {
                            if item.vote_average > 7 {
                                PopularMovieView(image: "\(backdropImageBaseURL)\(item.backdrop_path)")
                                
                            } else {
                                UnpopularMovieView(unpopularMovieData: item)
                                    .padding(.leading, 10)
                                    .padding(.trailing, 10)
                            }
                        }//Navigationlink
                    }.onDelete(perform: deleteItem)
                }//VGrid
                
            }//:ScrollView
            .navigationTitle("Brew Apps")
            .padding()
        }//:NavigationView
        .onAppear {
            self.apiManager.getDataFromAPI()
        }
        .preferredColorScheme(.dark)
    }
    
    func deleteItem(at offset: IndexSet) {
        //TODO: - Remove Item
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
