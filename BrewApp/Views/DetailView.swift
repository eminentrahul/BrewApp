//
//  DetailView.swift
//  BrewApp
//
//  Created by Rahul Ravi Prakash on 19/12/21.
//

import SwiftUI

struct DetailView: View {
    
    var item: Result?
    
    var body: some View {
        VStack(spacing: 10) {
            PopularMovieView(image: "\(backdropImageBaseURL)\(item!.backdrop_path)")
            
            VStack(alignment: .leading, spacing: 16) {
                Text(item!.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                
                Text("Release Date: \(item!.release_date)")
                    .font(.subheadline)
                
                HStack {
                    ForEach (0..<5) { _ in
                        Image(systemName: "star.fill")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                    
                }//:HStack
                
                Text(item!.overview)
                    .foregroundColor(.white)
                    .font(.subheadline)
            }
            .padding(.leading, 20)
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
