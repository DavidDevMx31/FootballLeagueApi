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

extension TeamDetail {
    init(response: SearchTeamsResponse.TeamData) {
        self.id = Int(response.idTeam)!
        self.name = response.strTeam
        self.badgeUrlString = response.strBadge
        self.country = response.strCountry
        self.formedYear = response.intFormedYear
        self.keywords = response.strKeywords
        self.location = response.strLocation
        self.league = response.strLeague
        self.description = response.strDescriptionEN
    }
}
