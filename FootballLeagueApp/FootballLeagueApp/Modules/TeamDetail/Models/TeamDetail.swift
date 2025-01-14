//
//  TeamDetail.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import Foundation

public struct TeamDetail {
    let id: Int
    let name: String
    let badgeUrlString: String
    let country: String
    let formedYear: String
    let keywords: String
    let location: String
    let league: String
    let description: String
    
    static let example = TeamDetail(id: -1, name: "Example", badgeUrlString: "", country: "Mexico", formedYear: "1900", keywords: "example", location: "Mexico", league: "Liga MX", description: "This is an example item")
}
