//
//  TeamDetailSource.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import Foundation

protocol TeamDetailSource {
    func fetchTeamDetailBy(name: String) async -> [TeamDetail]
}
