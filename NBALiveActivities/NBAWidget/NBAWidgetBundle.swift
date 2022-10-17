//
//  NBAWidgetBundle.swift
//  NBAWidget
//
//  Created by JerryLiu on 2022/10/12.
//

import WidgetKit
import SwiftUI

@main
struct NBAWidgetBundle: WidgetBundle {
    var body: some Widget {
        NBAWidget()
        NBAWidgetLiveActivity()
    }
}
