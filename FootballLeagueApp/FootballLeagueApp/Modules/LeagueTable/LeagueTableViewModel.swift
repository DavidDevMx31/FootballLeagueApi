//
//  LeagueTableViewModel.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import Foundation

class LeagueTableViewModel: ObservableObject {
    @Published private(set) var items: [LeagueTableItem] = []
    private let leagueTableSource: LeagueTableSource
    
    init(source: LeagueTableSource = LeagueTableApiSource()) {
        self.leagueTableSource = source
    }
    
    @MainActor
    func fetchLookupTable() async {
        items = await leagueTableSource.fetchLeagueTable()
    }
}
