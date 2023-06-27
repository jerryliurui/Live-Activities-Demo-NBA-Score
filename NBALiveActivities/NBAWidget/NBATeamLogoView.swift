//
//  NBATeamLogoView.swift
//  NBAWidgetExtension
//
//  Created by JerryLiu on 2022/10/12.
//

import SwiftUI
import WidgetKit
import AppIntents

struct NBATeamLogoView: View {
    var team: NBATeam
    
    var inDynamicIsland: Bool
    
    var likeNum: Int
    
    var body: some View {
        ZStack {
            if inDynamicIsland {
                VStack(alignment: .center, spacing: 2.0) {
                    
                    Spacer()
                    
                    Text(team.teamName)
                        .lineLimit(1)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    
                    if #available(iOS 17.0, *) {
                        HStack {
                            Text(likeNum.formatted())
                                .foregroundColor(.white)
                                .contentTransition(.numericText())
                            Button(intent: favorAppIntent(teamId: team.teamId)) {
                                Image(systemName: "hand.thumbsup")
                                    .foregroundColor(.white)
                            }
                            .buttonStyle(.plain)
                        }
                    } else {
                        Text(team.teamState)
                            .lineLimit(1)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                }
                .frame(width: 70, height: 120)
                .padding(.bottom, 8)
                .padding(.top, 8)
                
                Image(team.teamLogo)
                    .resizable()
                    .frame(width: 94, height: 94)
                    .offset(y:-15)
            } else {
                VStack(alignment: .center, spacing: 2.0) {
                    
                    Spacer()
                    
                    Text(team.teamName)
                        .modifier(LuminanceReducedLinearGradientColor(foregroundColor: Color(team.teamColor)))
                        .lineLimit(1)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    if #available(iOS 17.0, *) {
                        HStack {
                            Text(likeNum.formatted())
                                .foregroundColor(.white)
                                .contentTransition(.numericText())
                            Button(intent: favorAppIntent(teamId: team.teamId)) {
                                Image(systemName: "hand.thumbsup")
                                    .foregroundColor(.white)
                            }
                            .buttonStyle(.plain)
                        }
                    } else {
                        Text(team.teamState)
                            .modifier(LuminanceReducedLinearGradientColor(foregroundColor: Color(team.teamColor)))
                            .lineLimit(1)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                }
                .frame(width: 70, height: 120)
                .padding(.bottom, 8)
                .padding(.top, 8)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                
                ZStack {
                    Image(team.teamLogo)
                        .resizable()
                        .frame(width: 94, height: 94)
                    .offset(y:-15)
                }
            }
        }
        .widgetBackground()
    }
}

struct StrokeStyle: ViewModifier {
    var cornerRadius: CGFloat
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.6 : 0.3),
                            .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
                        ], startPoint: .top, endPoint: .bottom
                    )
                )
                .blendMode(.overlay)
        )
    }
}

extension View {
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}

extension View {
     func widgetBackground() -> some View {
         if #available(iOS 17.0, *) {
             return containerBackground(for: .widget) {
                 Color.clear
             }
         } else {
             return background {
                 Color.clear
             }
         }
    }
}

struct NBATeamLogoView_Previews: PreviewProvider {
    static var previews: some View {
        NBATeamLogoView(team: MatchDataManager.shared.teams.filter { $0.teamId == "Lakers" }.first!, inDynamicIsland: false,likeNum: 100)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
