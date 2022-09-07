//
//  DataSpace.swift
//  CanvasDemo
//
//  Created by Richard Turton on 28/08/2022.
//

import SwiftUI

struct DataSpace: View {
    var body: some View {
        Canvas { context, size in
            let points = [
                CGPoint(x: 0, y: 0),
                CGPoint(x: 10, y: 15),
                CGPoint(x: 20, y: 15),
                CGPoint(x: 30, y: 30),
                CGPoint(x: 40, y: 30),
                CGPoint(x: 50, y: 50),
                CGPoint(x: 60, y: 50),
                CGPoint(x: 70, y: 70),
                CGPoint(x: 80, y: 70),
                CGPoint(x: 90, y: 80),
                CGPoint(x: 100, y: 100)
            ]

            let path = Path { p in
                p.addLines(points)
            }

            let dataSize = path.boundingRect.size

            let transform = CGAffineTransform.identity
            // Flip the axis
                .translatedBy(x: 0, y: size.height)
                .scaledBy(x: 1, y: -1)
            // X scale
.scaledBy(x: size.width / dataSize.width, y: 1)
            // Y scale
                .scaledBy(x: 1, y: size.height / dataSize.height)

            context.stroke(
                path.applying(transform),
                with: .color(.blue),
                style: StrokeStyle(lineWidth: 3)
            )
        }
    }
}

struct DataSpace_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DataSpace()
                .frame(width: 300, height: 200)
                .border(.black)
        }
    }
}
