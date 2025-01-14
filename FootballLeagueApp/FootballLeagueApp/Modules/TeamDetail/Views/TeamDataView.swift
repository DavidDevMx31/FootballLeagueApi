//
//  TeamDataView.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import SwiftUI

struct TeamDataView: View {
    let data: TeamDetail?
    
    var body: some View {
        if data == nil {
            DataNotFoundView
        } else {
            TeamInfoView
        }
    }
    
    let verticalSpacing: CGFloat = 12
    let horizontalSpacing: CGFloat = 24
    
    var DataNotFoundView: some View {
        Group {
            Spacer()
            Text("No data found for requested team.")
            Spacer()
        }
    }
    
    var TeamInfoView: some View {
        ScrollView {
            AsyncImage(url: URL(string: data?.badgeUrlString ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
            .frame(width: 120, height: 120)
            .padding(.vertical, 8)
            
            VStack(alignment: .leading, spacing: verticalSpacing) {
                Text("About")
                    .font(.largeTitle)
                
                HStack(alignment: .center, spacing: horizontalSpacing) {
                    Text("Formed year:")
                        .bold()
                    Text(data!.formedYear)
                        .foregroundColor(.gray)
                }
                
                HStack(alignment: .center, spacing: horizontalSpacing) {
                    Text("Country:")
                        .bold()
                    Text(data!.country)
                        .foregroundColor(.gray)
                }
                
                HStack(alignment: .center, spacing: horizontalSpacing) {
                    Text("Location:")
                        .bold()
                    Text(data!.location)
                        .foregroundColor(.gray)
                }
                
                HStack(alignment: .center, spacing: horizontalSpacing) {
                    Text("League:")
                        .bold()
                    Text(data!.league)
                        .foregroundColor(.gray)
                }
                
                HStack(alignment: .center, spacing: horizontalSpacing) {
                    Text("Aliases:")
                        .bold()
                    Text(data!.keywords)
                        .foregroundColor(.gray)
                }
                
                Text("History")
                    .font(.largeTitle)
                
                Text(data!.description)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .padding()
            }
        
        }
        .padding(.horizontal, 8)
    }
}

struct TeamDataView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDataView(data: nil)
    }
}
