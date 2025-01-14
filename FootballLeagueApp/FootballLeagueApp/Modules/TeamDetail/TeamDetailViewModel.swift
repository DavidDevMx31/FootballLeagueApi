//
//  TeamDetailViewModel.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import Foundation

final class TeamDetailViewModel: ObservableObject {
    @Published private(set) var teamDetail: TeamDetail?
    
    @MainActor
    func fetchDetail(for teamName: String) async {
        teamDetail = TeamDetail.example
    }
}
