//
//  BasicCommands.swift
//  CanvasDemo
//
//  Created by Richard Turton on 18/08/2022.
//

import SwiftUI

struct BasicCommands: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                let midX = size.width * 0.5
                let midY = size.height * 0.5
                context.draw(
                    Text("Hello, World!"),
                    at: CGPoint(x: midX, y: 20))
                let circleRect = CGRect(x: midX, y: midY, width: 60, height: 60)
                    .offsetBy(dx: -30, dy: -90)
                let circle = Path(ellipseIn: circleRect)
                context.fill(circle, with: .color(.blue))
                let globe = Image(systemName: "globe.europe.africa.fill")
                context.draw(globe, in: circleRect)
            }
            .frame(width: 300, height: 300)
        }
    }
}

struct BasicCommands_Previews: PreviewProvider {
    static var previews: some View {
        BasicCommands()
    }
}
