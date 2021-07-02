//
//  MovieViewModel.swift
//  BlurhashPOC
//
//  Created by marilyn A on 7/1/21.
//

import UIKit

class MovieViewModel {

    private let analytics: AnalyticsProtocol
    
    let movies = [["id": 1],["id": 2,],["id": 3],["id":4]]
    
    init(analytics: AnalyticsProtocol){
        self.analytics = analytics
    }
    
    func selectMovie(at index:Int){
        let movie = movies[index]
        guard let id = movie["id"] else {return}
        analytics.trackEvent(.movieTapped(id:id, index: index))
    }
}
