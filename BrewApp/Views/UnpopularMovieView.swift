//
//  UnpopularMovieView.swift
//  BrewApp
//
//  Created by Rahul Ravi Prakash on 19/12/21.
//

import SwiftUI

struct UnpopularMovieView: View {
    
    @State var unpopularMovieData: Result
    
    var body: some View {
        HStack (spacing: 12) {
            
            AsyncImage(url: URL(string: "\(posterBaseURL)\(unpopularMovieData.poster_path)")!, scale: 1.0)
                .scaledToFit()
                .cornerRadius(12)
                
            Spacer()
            VStack (alignment: .leading, spacing: 10) {
                Text(unpopularMovieData.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
                Text(unpopularMovieData.overview)
                    .font(.footnote)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding()
        
    }
}

struct UnpopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        UnpopularMovieView(unpopularMovieData: Result(title: "", poster_path: "", overview: "", vote_average: 0.0, backdrop_path: "", release_date: ""))
            .previewLayout(.sizeThatFits)
            .padding()
            .background(.secondary)
    }
}
