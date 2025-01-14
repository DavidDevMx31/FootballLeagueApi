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

extension LeagueTableItem {
    
    init(resultItem: LeagueTableResult.ResultItem) {
        self.id = Int(resultItem.idTeam)!
        self.rank = resultItem.intRank
        self.teamName = resultItem.strTeam
        self.badgeUrl = resultItem.strBadge
        self.wins = Int(resultItem.intWin)!
        self.draws = Int(resultItem.intDraw)!
        self.losses = Int(resultItem.intLoss)!
    }
}
