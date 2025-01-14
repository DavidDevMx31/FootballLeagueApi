//
//  LeagueTableSource.swift
//  FootballLeagueApp
//
//  Created by David Ali on 14/01/25.
//

import Foundation

protocol LeagueTableSource {
    func fetchLeagueTable() async -> [LeagueTableItem]
}

final class LeagueTableApiSource: LeagueTableSource {
    
    let baseURL = URL(string: "https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2020-2021")
    
    func fetchLeagueTable() async -> [LeagueTableItem] {
        let components = URLComponents(url: baseURL!, resolvingAgainstBaseURL: true)
        let request = URLRequest(url: components!.url!)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let urlResponse = response as? HTTPURLResponse,
                  (200...299).contains(urlResponse.statusCode) else {
                return []
            }
            
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(LeagueTableResult.self, from: data)
            
            let items = decodedData.results.map { LeagueTableItem(resultItem: $0) }
            return items
        } catch let error {
            debugPrint(error)
            return []
        }
    }
    
}
