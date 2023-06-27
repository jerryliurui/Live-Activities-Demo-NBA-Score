//
//  NBAWidgetLiveActivity.swift
//  NBAWidget
//
//  Created by JerryLiu on 2022/10/12.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct NBAWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var homeScore: Int
        var guestScore: Int
        var homeLike: Int
        var guestLike: Int
        var tips: String
        
        var score: String?
        var time: TimeInterval
    }

    // Fixed non-changing properties about your activity go here!
    var home: NBATeam
    var guest: NBATeam
}

struct NBAWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: NBAWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            NBAWidgetLockScreenView(attribute: context.attributes,guestTeam: context.attributes.guest, homeTeam: context.attributes.home, state: context.state)
            .activityBackgroundTint(Color(context.attributes.home.teamColor))
            .activitySystemActionForegroundColor(Color(context.attributes.home.teamGuestColor))
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    NBATeamLogoView(team: context.attributes.guest, inDynamicIsland: true, likeNum: context.state.guestLike)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    NBATeamLogoView(team: context.attributes.home, inDynamicIsland: true, likeNum: context.state.homeLike)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    
                }
                DynamicIslandExpandedRegion(.center) {
                    ScoreView(attribute: context.attributes, state: context.state)
                }
            } compactLeading: {
                LeadingView(attribute: context.attributes, state: context.state)
            } compactTrailing: {
                TrailingView(attribute: context.attributes, state: context.state)
            } minimal: {
                ZStack {
                    Image(context.attributes.guest.teamLogo)
                        .resizable()
                        .frame(width: 37, height: 37)
                        .offset(x:-6)
                    Image(context.attributes.home.teamLogo)
                        .resizable()
                        .frame(width: 37, height: 37)
                        .offset(x:6)
                }
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.indigo)
        }
    }
}
