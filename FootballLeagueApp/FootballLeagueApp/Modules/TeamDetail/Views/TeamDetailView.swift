//
//  TeamDetailView.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import SwiftUI

struct TeamDetailView: View {
    @StateObject var detail = TeamDetailViewModel()
    let name: String
    
    var body: some View {
        Text(name)
            .font(.title)
            .navigationTitle(name)
            .task {
                await detail.fetchDetail(for: name)
            }
    }
}

struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView(name: "Awesome team name")
    }
}
