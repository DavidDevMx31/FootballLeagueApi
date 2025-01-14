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

final class TeamDetailApiSource: TeamDetailSource {
    
    let baseURL = URL(string: "https://www.thesportsdb.com/api/v1/json/3/searchteams.php")
    
    func fetchTeamDetailBy(name: String) async -> [TeamDetail] {
        var components = URLComponents(url: baseURL!, resolvingAgainstBaseURL: true)
        components?.queryItems = [
            URLQueryItem(name: "t", value: name)
        ]
        let request = URLRequest(url: components!.url!)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let urlResponse = response as? HTTPURLResponse,
                  (200...299).contains(urlResponse.statusCode) else {
                return []
            }
            
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(SearchTeamsResponse.self, from: data)
            
            let details = decodedData.teams.map { TeamDetail(response: $0)}
            return details
            
        } catch let error {
            debugPrint(error)
            return []
        }
    }
}
