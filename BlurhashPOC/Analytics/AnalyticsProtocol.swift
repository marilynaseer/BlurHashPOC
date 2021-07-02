//
//  AnalyticsProtocol.swift
//  BlurhashPOC
//
//  Created by marilyn A on 7/1/21.
//

import Foundation

protocol AnalyticsProtocol {
    func trackEvent(_ event:AnalyticsEvent)
}
