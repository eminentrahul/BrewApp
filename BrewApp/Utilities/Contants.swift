//
//  Contants.swift
//  BrewApp
//
//  Created by Rahul Ravi Prakash on 19/12/21.
//

import Foundation

let nowPlayingURLString = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"

let posterBaseURL = "https://image.tmdb.org/t/p/w200"
let backdropImageBaseURL = "https://image.tmdb.org/t/p/w342"

let popularMovieSampleData: Result = Result(id: 1, title: "Spider-Man: No Way Home",
                                poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                                overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                                vote_average: 8.7,
                                backdrop_path: "/VlHt27nCqOuTnuX6bku8QZapzO.jpg",
                                release_date: "2021-12-15")


let unpopularMovieSampleData: Result = Result(id: 2, title: "Last Shoot Out",
                                              poster_path: "/pvEtPxotI3POlVPvNxgrHJuDXfe.jpg",
                                              overview: "Soon after a newlywed learns that her husband had her father shot down, she flees from the Callahan ranch in fear. She's rescued by a gunman who safeguards her at a remote outpost as he staves off her husband's attempts to reclaim his bride.",
                                              vote_average: 6.6,
                                              backdrop_path: "/upOi9aVqPPky7Ba4GsiyFdjc82I.jpg",
                                              release_date: "2021-12-15")
