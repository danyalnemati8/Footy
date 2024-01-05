//
//  StandingsTableObservable.swift
//  FCStats
//
//  Created by Danyal Nemati on 1/4/24.
//

import Foundation
import Observation
import XCAFootballDataClient

@Observable
class StandingsTableObservable {
    
    let client = FootballDataClient(apiKey: apiKey)
    //displays the team standing table
    var fetchPhase = FetchPhase<[TeamStandingTable]>.initial
    var standings: [TeamStandingTable]? {fetchPhase.value}
    
    func fetchStandings(competition: Competition) async {
        fetchPhase = .fetching
        do {
            let standings = try await client.fetchStandings(competitionId: competition.id)
        } catch {
            fetchPhase = .failure(error)
        }
    }
    
}
