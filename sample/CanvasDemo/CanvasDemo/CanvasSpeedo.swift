//
//  ContentView.swift
//  CanvasDemo
//
//  Created by Richard Turton on 26/04/2022.
//

import SwiftUI

struct CanvasSpeedo: View, Animatable {

    var speed: Double

    var animatableData: Double {
        get { speed }
        set { speed = newValue }
    }

    var body: some View {
        VStack {
            Canvas { context, size in

                let radius = size.width * 0.5
                context.translateBy(x: radius, y: radius)

                for labelSpeed: Double in stride(from: 0, through: 150, by: 10) {
                    var labelContext = context
                    labelContext.rotate(by: angle(for: labelSpeed))

                    labelContext.draw(
                        Text(labelSpeed.formatted()),
                        at: CGPoint(x: 0, y: -radius),
                        anchor: .top)
                }

                var arcContext = context
                arcContext.rotate(by: .degrees(-90))
                let arc = Path { p in
                    p.addArc(center: .zero,
                             radius: radius - 30,
                             startAngle: angle(for: 0),
                             endAngle: angle(for: 150), clockwise: false)
                }

                let gradient = Gradient(colors: [.green, .yellow, .orange, .red, .red])
                let shading = GraphicsContext.Shading.conicGradient(gradient, center: .zero, angle: angle(for: 0))
                arcContext.stroke(arc, with: shading, style: StrokeStyle(lineWidth: 10, dash: [2, 2]))

                let needle = Path { p in
                    p.addArc(center: .zero, radius: 20, startAngle: .degrees(-50), endAngle: .degrees(230), clockwise: false)
                    p.addLine(to: CGPoint(x: 0, y: -(radius - 40)))
                    p.closeSubpath()
                    p.addEllipse(in: CGRect(x: -10, y: -10, width: 20, height: 20))
                    p.closeSubpath()
                }

                var needleContext = context
                needleContext.rotate(by: angle(for: speed))
                needleContext.addFilter(.shadow(radius: 4))
                needleContext.fill(needle, with: .color(.primary), style: .init(eoFill: true))

            }
            .aspectRatio(1, contentMode: .fit)
            .accessibilityLabel(Text("\(speed) miles per hour"))
        }
    }

    private func angle(for speed: Double) -> Angle {
        .degrees((speed * 2) + 180 + 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    struct Container: View {
        @State var speed: Double = 60
        var body: some View {
            VStack {
                Slider(value: $speed, in: 0...150)
                CanvasSpeedo(speed: speed)

                Button("Stop") {
                    withAnimation {
                        speed = 0
                    }
                }.padding()

                Button("CHEESE IT!") {
                    withAnimation {
                        speed = 150
                    }
                }
            }
            .padding()
        }
    }

    static var previews: some View {
        Container()
    }
}
