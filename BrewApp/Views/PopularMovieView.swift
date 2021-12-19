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
            AsyncImage(url: URL(string: image)!, scale: 0.9)
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
        PopularMovieView(image: "image")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
