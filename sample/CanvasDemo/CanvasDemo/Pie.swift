//
//  Pie.swift
//  CanvasDemo
//
//  Created by Richard Turton on 31/08/2022.
//

import SwiftUI

struct Pie: View {

    @State var slices: [(Double, String, Color)]
    
    var body: some View {
        Canvas { context, size in
            let total = slices.reduce(0) { $0 + $1.0 }
            context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
            var pieContext = context
            pieContext.rotate(by: .degrees(-90))
            let radius = min(size.width, size.height) * 0.48
            var startAngle = Angle.zero
            for (value, label, color) in slices {
                let angle = Angle(degrees: 360 * (value / total))
                let endAngle = startAngle + angle
                let path = Path { p in
                    p.move(to: .zero)
                    p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                    p.closeSubpath()
                }
                pieContext.fill(path, with: .color(color))
                pieContext.stroke(path, with: .color(.primary))

                let mid = (startAngle + endAngle) * 0.5
                var text = context
                text.rotate(by: mid)
                text.translateBy(x: 0, y: -radius * 0.8)
                text.rotate(by: -mid)
                text.draw(Text(label), at: .zero)
                startAngle = endAngle
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct Pie_Previews: PreviewProvider {
    static var previews: some View {
        Pie(slices: [
            (2, "A", .red),
            (3, "B", .orange),
            (4, "C", .yellow),
            (1, "D", .green),
            (5, "E", .blue),
            (4, "F", .indigo),
            (2, "G", .purple)
        ])
    }
}
