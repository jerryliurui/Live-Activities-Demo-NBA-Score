//
//  TrailingView.swift
//  NBAWidgetExtension
//
//  Created by JerryLiu on 2022/10/12.
//

import SwiftUI

struct TrailingView: View {
    @State var attribute: NBAWidgetAttributes
    @State var state: NBAWidgetAttributes.ContentState
    var body: some View {
        HStack {
            Text("\(state.homeScore)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color(attribute.home.teamColor))
            Image(attribute.home.teamLogo)
                .resizable()
                .frame(width: 36, height: 36)
        }
    }
}
