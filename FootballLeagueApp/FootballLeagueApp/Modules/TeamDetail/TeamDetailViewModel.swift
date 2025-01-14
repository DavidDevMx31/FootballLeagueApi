//
//  TeamDetailViewModel.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import Foundation

final class TeamDetailViewModel: ObservableObject {
    @Published private(set) var teamDetail: TeamDetail?
    private let source: TeamDetailSource
    
    init(source: TeamDetailSource = TeamDetailApiSource()) {
        self.source = source
        self.teamDetail = TeamDetail.example
    }
    
    @MainActor
    func fetchDetail(for teamName: String) async {
        let results = await source.fetchTeamDetailBy(name: teamName)
        
        if results.count == 1 {
            teamDetail = results[0]
        } else {
            teamDetail = nil
        }
    }
}
