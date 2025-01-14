//
//  LeagueTableView.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import SwiftUI

struct LeagueTableView: View {
    @StateObject var viewModel = LeagueTableViewModel()
    @State private var sortBy = TableSortByProperty.rank
    @State private var showingFiltersSheet = false
    
    private var sortedItems: [LeagueTableItem] {
        switch sortBy {
        case .rank:
            return viewModel.items.sorted(using: KeyPathComparator(\.rank))
        case .win:
            return viewModel.items.sorted(using: KeyPathComparator(\.wins))
        case .draw:
            return viewModel.items.sorted(using: KeyPathComparator(\.draws))
        case .loss:
            return viewModel.items.sorted(using: KeyPathComparator(\.losses))
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(sortedItems) { item in
                        NavigationLink(destination:
                                        TeamDetailView(name: item.teamName)) {
                            LeagueTableItemView(item: item)
                        }
                    }
                } header: {
                    tableHeaderView
                } footer: {
                    HStack(alignment: .center) {
                        Text("Elements sorted by: \(sortBy.rawValue)")
                        Spacer()
                        Text("Order: Ascending")
                    }
                }
            }
            .navigationTitle("League Table")
            .sheet(isPresented: $showingFiltersSheet) {
                LeagueTableFiltersView(currentFilter: $sortBy,
                                 isPresented: $showingFiltersSheet)
                .presentationDetents([.fraction(0.4)])
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sort by") {
                        showingFiltersSheet.toggle()
                    }
                }
            }
        }
        .task {
            await viewModel.fetchLookupTable()
        }
    }
    
    var tableHeaderView: some View {
        HStack(spacing: 8) {
            Text("Rank")
            
            Text("Team name")
            
            Spacer()
            
            Text("W")
                .frame(width: 28)
            Text("D")
                .frame(width: 28)
            Text("L")
                .frame(width: 28)
        }
    }
}

struct LeagueTableView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueTableView()
    }
}
