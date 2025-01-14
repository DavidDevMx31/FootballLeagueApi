//
//  LeagueTableItem.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import Foundation

struct LeagueTableItem: Identifiable {
    let id: Int
    let rank: String
    let teamName: String
    let badgeUrl: String
    let wins: Int
    let draws: Int
    let losses: Int
    
    static let example = LeagueTableItem(id: 1, rank: "1", teamName: "Example name", badgeUrl: "", wins: 0, draws: 0, losses: 0)
}
