//
//  NBATeam.swift
//  NBALiveActivities
//
//  Created by JerryLiu on 2022/10/12.
//

import Foundation

public class NBATeam : Codable, Hashable {
    public static func == (lhs: NBATeam, rhs: NBATeam) -> Bool {
        return lhs.teamId == rhs.teamId
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(teamName)
        hasher.combine(teamId)
        hasher.combine(teamLogo)
        hasher.combine(teamColor)
        hasher.combine(teamGuestColor)
        hasher.combine(teamState)
    }
    
    public var teamName: String = ""
    public var teamId: String = ""
    public var teamLogo: String = ""
    public var teamColor: String = ""
    public var teamGuestColor: String = ""
    public var teamState: String = ""
    
    init(teamName: String, teamId: String, teamLogo: String, teamColor: String, teamGuestColor: String, teamState: String) {
        self.teamName = teamName
        self.teamId = teamId
        self.teamLogo = teamLogo
        self.teamColor = teamColor
        self.teamGuestColor = teamGuestColor
        self.teamState = teamState
    }
}
