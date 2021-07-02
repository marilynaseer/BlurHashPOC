//
//  AnalyticsEvent.swift
//  BlurhashPOC
//
//  Created by marilyn A on 7/1/21.
//

import Foundation

struct AnalyticsEvent {
    let name : String
    let payload : [String:Any]
}

extension AnalyticsEvent {
    static func movieTapped(id:Int,index:Int) -> AnalyticsEvent{
        let payload = ["movie_id": id,"movie_index":index]
        return AnalyticsEvent(name: "movie_tapped", payload: payload)
    }
}
