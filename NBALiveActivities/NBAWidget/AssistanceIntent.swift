//
//  AssistanceIntent.swift
//  NBALiveActivities
//
//  助力按钮
//
//  Created by JerryLiu on 2023/6/25.
//

import Foundation
import AppIntents

struct favorAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Like")
    var teamId: String
    
    init() {
        
    }
    
    //to hold data
    init(teamId: String) {
        self.teamId = teamId
    }
    
    func perform() async throws -> some IntentResult {
        if let index = MatchDataManager.shared.teams.firstIndex(where: {
            $0.teamId == teamId
        }) {
            let resultTeam = MatchDataManager.shared.teams[index];
            resultTeam.likeNum += 10
            NBALiveTrigger.shared.updateLiveActivitiesLAVSWA()
        }
        
        return .result()
    }
}
