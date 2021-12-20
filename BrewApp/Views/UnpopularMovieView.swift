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
        HStack (spacing: 8) {
            
            AsyncImage(url: URL(string: "\(posterBaseURL)\(unpopularMovieData.poster_path)")!, scale: 1.35)
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
    }
}

struct UnpopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        UnpopularMovieView(unpopularMovieData: unpopularMovieSampleData)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(.secondary)
    }
}
