//
//  TeamDetailView.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import SwiftUI

struct TeamDetailView: View {
    @StateObject var viewModel = TeamDetailViewModel()
    let name: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            if viewModel.fetchState == .inProgress {
                //Activity Indicator, loading view, etc...
                Spacer()
                Text("Loading data...")
                Spacer()
            } else if viewModel.fetchState == .completed {
                TeamDataView(data: viewModel.teamDetail)
            }
        }
        .navigationTitle(name)
        .task {
            await viewModel.fetchDetail(for: name)
        }
    }
}

struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView(name: "Awesome team name")
    }
}
