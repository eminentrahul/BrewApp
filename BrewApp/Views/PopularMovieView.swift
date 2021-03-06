//
//  PopularMovieView.swift
//  BrewApp
//
//  Created by Rahul Ravi Prakash on 19/12/21.
//

import SwiftUI

struct PopularMovieView: View {
    
    @State var image: String
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: image)!, scale: 1.0)
                .scaledToFill()
                .cornerRadius(12)
            
            Image(systemName: "play.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.white)
        }
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovieView(image: unpopularMovieSampleData.poster_path)
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 250))

    }
}
