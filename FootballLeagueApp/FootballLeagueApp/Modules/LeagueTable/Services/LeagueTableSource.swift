//
//  LeagueTableSource.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import Foundation

protocol LeagueTableSource {
    func fetchLeagueTable() async -> [LeagueTableItem]
}

final class LeagueTableApiSource: LeagueTableSource {
    
    func fetchLeagueTable() async -> [LeagueTableItem] {
        return []
    }
    
}
