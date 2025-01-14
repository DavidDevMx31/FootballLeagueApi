//
//  LeagueTableResult.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import Foundation

struct LeagueTableResult: Decodable {
    let results: [ResultItem]
    
    struct ResultItem: Decodable {
        let idTeam: String
        let intRank: String
        let strTeam: String
        let strBadge: String
        let intWin: String
        let intLoss: String
        let intDraw: String
    }
    
    enum CodingKeys: String, CodingKey {
        case results = "table"
    }
}
