//
//  LeagueTableFiltersView.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import SwiftUI

struct LeagueTableFiltersView: View {
    @Binding var currentFilter: TableSortByProperty
    @Binding var isPresented: Bool
    @State var draft: TableSortByProperty
    
    init(currentFilter: Binding<TableSortByProperty>, isPresented: Binding<Bool>) {
        _currentFilter = currentFilter
        _isPresented = isPresented
        _draft = State(wrappedValue: currentFilter.wrappedValue)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text("Select a property to sort items")
            
            Picker(selection: $draft) {
                ForEach(TableSortByProperty.allCases, id: \.self) { value in
                    Text(value.rawValue)
                        .tag(value)
                        .font(.title)
                }
            } label: {
                Text("Select a property to sort items")
            }
            .pickerStyle(.segmented)
            
            doneButton
        }
        .padding()
    }
    
    var doneButton: some View {
        Button {
            self.currentFilter = draft
            self.isPresented = false
        } label: {
            Label("Done", systemImage: "checkmark.circle")
        }
        .buttonStyle(.borderedProminent)
    }
}

struct LeagueTableFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueTableFiltersView(currentFilter: Binding.constant(.rank),
                               isPresented: Binding.constant(true))
    }
}
