//
//  PlayerView.swift
//  NBALiveActivities
//
//  Created by JerryLiu on 2022/10/12.
//

import SwiftUI
import WidgetKit

struct PlayerView: View {
    var body: some View {
        HStack(spacing: 2.0) {
            Image("james")
                .resizable()
            .frame(width: 70, height: 60)
            
            Text("+2")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color(.red))
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
