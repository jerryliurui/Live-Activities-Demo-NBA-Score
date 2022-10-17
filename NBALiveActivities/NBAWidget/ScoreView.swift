//
//  ScoreView.swift
//  NBALiveActivities
//
//  Created by JerryLiu on 2022/10/12.
//

import SwiftUI
import WidgetKit

struct ScoreView: View {
    @State var attribute: NBAWidgetAttributes
    @State var state: NBAWidgetAttributes.ContentState
    var body: some View {
        VStack(alignment: .center, spacing: 6.0) {
            HStack {
                Text("\(state.guestScore)")
                    .font(.title)
                    .fontWeight(.bold)
                    //.modifier(LuminanceReducedColor(foregroundColor: Color(attribute.guest.teamGuestColor)))
                    .luminanceReducedColor(color: Color(attribute.guest.teamGuestColor))
                
                Text(":")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                
                Text("\(state.homeScore)")
                    .font(.title)
                    .fontWeight(.bold)
                    .modifier(LuminanceReducedColor(foregroundColor: Color(attribute.home.teamColor)))
            }
            .padding(.horizontal, 5.0)
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
            
            HStack(alignment: .center, spacing: 2.0) {
                Circle()
                    .foregroundColor(.red)
                    .frame(width: 6, height: 6)
                Text(state.tips)
                    .font(.footnote)
                    .foregroundStyle(.white)
                Text(timerInterval: Date.now...Date(timeIntervalSince1970: state.time), countsDown: true)
                    .multilineTextAlignment(.center)
                    .frame(width: 50)
                    .monospacedDigit()
                    .font(.footnote)
                    .foregroundStyle(.white)
            }
            
            HStack(alignment: .center, spacing: 1.0) {
                Text("NBA 常规赛")
                    .font(.footnote)
                    .foregroundStyle(.white)
            }
            
            if let scoreNum = state.score {
                Text(scoreNum)
                    .transition(.moveAndFade)
                    .font(.footnote)
                    .foregroundStyle(.white)
            }
        }
        .padding(.vertical, 6.0)
    }
}
