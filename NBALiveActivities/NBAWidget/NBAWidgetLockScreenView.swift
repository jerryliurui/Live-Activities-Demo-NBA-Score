//
//  NBAWidgetLockScreenView.swift
//  NBAWidgetExtension
//
//  Created by JerryLiu on 2022/10/12.
//

import SwiftUI
import WidgetKit
import AppIntents

struct NBAWidgetLockScreenView: View {
    @State var attribute: NBAWidgetAttributes
    
    @State var guestTeam: NBATeam
    @State var homeTeam: NBATeam
    
    @State var state: NBAWidgetAttributes.ContentState
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(guestTeam.teamGuestColor),Color(homeTeam.teamColor)], startPoint: .topLeading, endPoint: .bottom)
            
            HStack {
                NBATeamLogoView(team: guestTeam, inDynamicIsland: false,likeNum: state.guestLike)
            
                ScoreView(attribute: attribute, state: state)
                
                NBATeamLogoView(team: homeTeam, inDynamicIsland:false, likeNum: state.homeLike)
            }
            .padding(.horizontal, 2.0)
        }
        .frame(height: 160)
    }
}

struct NBAWidgetLockScreenView_Previews: PreviewProvider {
    static var previews: some View {
        let guestTeam = NBATeam(teamName: "Lakers", teamId: "Lakers", teamLogo: "Los Angles Lakers logo", teamColor: "LakerHome", teamGuestColor: "LakerGuest", teamState: "12胜3负",likeNum: 100)
        let homeTeam = NBATeam(teamName: "Warriors", teamId: "WarriorsHome", teamLogo: "golden-state-warriors", teamColor: "WarriorsHome",teamGuestColor: "WarriorsGuest", teamState: "14胜1负",likeNum: 100)
        let attribute = NBAWidgetAttributes(home: homeTeam, guest: guestTeam)
        
        let date = Calendar.current.date(byAdding: .minute, value: (12), to: Date())!.timeIntervalSince1970
        
        let startState = NBAWidgetAttributes.ContentState(homeScore: 12, guestScore: 20,homeLike: 100,guestLike: 105, tips: "Q1 11:08", score: "+2", time: date)
        NBAWidgetLockScreenView(attribute: attribute,guestTeam: guestTeam,homeTeam: homeTeam, state: startState)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
