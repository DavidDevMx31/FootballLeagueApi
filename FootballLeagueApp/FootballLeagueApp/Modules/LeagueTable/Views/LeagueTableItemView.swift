//
//  LeagueTableItemView.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import SwiftUI

struct LeagueTableItemView: View {
    let rank: String
    let imageURL: URL?
    let teamName: String
    let win: Int
    let draw: Int
    let loss: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Text(rank)
                .minimumScaleFactor(0.8)
                .lineLimit(1)
                .bold()
                .frame(width: 20)
            
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray
            }
            .frame(width: 36, height: 36)

                
            Text(teamName)
                .minimumScaleFactor(0.8)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
            
            Spacer()
            
            Text("\(win)")
                .lineLimit(1)
                .italic()
                .frame(width: 28)
            
            Text("\(draw)")
                .lineLimit(1)
                .italic()
                .frame(width: 28)
            
            Text("\(loss)")
                .lineLimit(1)
                .italic()
                .frame(width: 28)
            
        }
    }
    
}

extension LeagueTableItemView {
    
    init(item: LeagueTableItem) {
        self.rank = "\(item.rank)"
        self.imageURL = URL(string: item.badgeUrl)
        self.teamName = item.teamName
        self.win = item.wins
        self.draw = item.draws
        self.loss = item.losses
    }
    
}

struct LeagueTableItemView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueTableItemView(item: LeagueTableItem.example)
    }
}
