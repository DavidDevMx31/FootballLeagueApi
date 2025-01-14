//
//  SearchTeamsResponse.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import Foundation

struct SearchTeamsResponse: Decodable {
    let teams: [TeamData]
    
    struct TeamData: Decodable {
        let idTeam: String
        let strTeam: String
        let strBadge: String
        let strCountry: String
        let intFormedYear: String
        let strKeywords: String
        let strLocation: String
        let strLeague: String
        let strDescriptionEN: String
    }
}
