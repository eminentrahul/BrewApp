//
//  ContentView.swift
//  BrewApp
//
//  Created by Rahul Ravi Prakash on 19/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var apiManager = APIManager()
    @State var searchText = ""
    let layout = [GridItem(.flexible())]
    var body: some View {
        NavigationView {
//            ScrollView (showsIndicators: false){
            VStack {
                HStack {
                    TextField("Search", text: $searchText)
                        .padding(.leading, 24)
                }
                .padding()
                .background(Color(.systemGray))
                .cornerRadius(6)
                .padding(.horizontal, 10)
                
                List {
                    
                    let sortedData = apiManager.result.sorted(by: {$0.vote_average > $1.vote_average})
                    
                    
                    ForEach (sortedResult.filter({"\($0)".contains(searchText) || searchText.isEmpty}), id: \.self) { item in
                        
                        NavigationLink(destination: DetailView(item: item)) {
                            if item.vote_average > 7 {
                                PopularMovieView(image: "\(backdropImageBaseURL)\(item.backdrop_path)")

                            } else {
                                UnpopularMovieView(unpopularMovieData: item)
                                    .frame(height: 250)
                            }
                        }//Navigationlink
                    }.onDelete(perform: deleteItem)
                        .listRowBackground(Color.black)
                        .padding(.horizontal, 0)
                } //VGrid
            } //:VStack
            .navigationTitle("Brew Apps")
            .padding(.horizontal, 0)
        }//:NavigationView
        .onAppear {
            if sortedResult.count == 0 {
                self.apiManager.getDataFromAPI()
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func deleteItem(at offset: IndexSet) {
        //TODO: - Remove Item
        sortedResult.remove(atOffsets: offset)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
