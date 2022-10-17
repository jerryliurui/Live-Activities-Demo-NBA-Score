//
//  Animation.swift
//  NBALiveActivities
//
//  Created by JerryLiu on 2022/10/12.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .bottom).combined(with: .opacity).combined(with: .scale(scale: 1.2)),
            removal: .scale.combined(with: .opacity)
        )
    }
}
