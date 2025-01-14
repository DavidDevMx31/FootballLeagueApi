//
//  TeamDetailSourceStub.swift
//  FootballLeagueAppTests
//
//  Created by David Ali on 14/01/25.
//

import Foundation
import FootballLeagueApp

struct TeamDetailSourceStub: TeamDetailSource {
    var items: [TeamDetail]
    
    init(stubItems: [TeamDetail] = []) {
        self.items = stubItems
    }
    
    func fetchTeamDetailBy(name: String) async -> [TeamDetail] {
        items
    }
    
    
}
