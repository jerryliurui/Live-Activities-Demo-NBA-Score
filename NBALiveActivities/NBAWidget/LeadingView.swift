//
//  LeadingView.swift
//  NBAWidgetExtension
//
//  Created by JerryLiu on 2022/10/12.
//

import SwiftUI

struct LeadingView: View {
    @State var attribute: NBAWidgetAttributes
    @State var state: NBAWidgetAttributes.ContentState
    var body: some View {
        HStack {
            Image(attribute.guest.teamLogo)
                .resizable()
                .frame(width: 36, height: 36)
            
            Text("\(state.guestScore)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color(attribute.guest.teamGuestColor))
        }
    }
}

struct LeadingView_Previews: PreviewProvider {
    static var previews: some View {
        let guestTeam = NBATeam(teamName: "Lakers", teamId: "Lakers", teamLogo: "Los Angles Lakers logo", teamColor: "LakerHome", teamGuestColor: "LakerGuest", teamState: "12胜3负",likeNum: 100)
        let homeTeam = NBATeam(teamName: "Warriors", teamId: "WarriorsHome", teamLogo: "golden-state-warriors", teamColor: "WarriorsHome",teamGuestColor: "WarriorsGuest", teamState: "14胜1负",likeNum: 101)
        let attribute = NBAWidgetAttributes(home: homeTeam, guest: guestTeam)
        
        let date = Calendar.current.date(byAdding: .minute, value: (12), to: Date())!.timeIntervalSince1970
        
        let startState = NBAWidgetAttributes.ContentState(homeScore: 12, guestScore: 20,homeLike: 101, guestLike: 104, tips: "Q1 11:08", score: "+2", time: date)
        LeadingView(attribute: attribute, state: startState)
    }
}
