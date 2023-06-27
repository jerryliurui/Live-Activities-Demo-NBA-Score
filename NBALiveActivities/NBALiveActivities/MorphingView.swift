//
//  MorphingView.swift
//  NBALiveActivities
//
//  Created by JerryLiu on 2022/10/24.
//

import SwiftUI

struct MorphingView: View {
    var body: some View {
        Canvas { context, size in
            let w = size.width
            let h = size.height
            
            // Draw background
            context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(Color(.sRGB, red: 230/255, green: 240/255, blue: 1, opacity: 1.0)))
            
            // Draw a square
            var squarePath = Path()
            squarePath.move(to: CGPoint(x: 50, y: 50))
            squarePath.addLine(to: CGPoint(x: 100, y: 50))
            squarePath.addLine(to: CGPoint(x: 100, y: 100))
            squarePath.addLine(to: CGPoint(x: 50, y: 100))
            context.fill(squarePath, with: .color(.blue))
            
            // Add a Filter
            context.addFilter(.saturation(2.5))
            
            // Draw Images
            context.draw(Image(systemName: "person.fill"), at: CGPoint(x: w / 2, y: h / 2.2))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MorphingView_Previews: PreviewProvider {
    static var previews: some View {
        MorphingView()
    }
}
