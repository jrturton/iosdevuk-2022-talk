////
////  CompositeSpeedo.swift
////  CanvasDemo
////
////  Created by Richard Turton on 27/04/2022.
////
//
//import SwiftUI
//
//struct CompositeSpeedo: View {
//
//    @Binding var speed: Double
//
//    var body: some View {
//        VStack {
//            GeometryReader { g in
//                let r = g.size.height * 0.5
//                let r1 = r - 10
//                ForEach(0..<16) { index in
//                    let speed = Double(index * 10)
//                    Text("\(speed.formatted())")
//                        .rotationEffect(angle(speed) + .degrees(90))
//                        .offset(x: r, y: r)
//                        .position(
//                            x: r1 * cos(angle(speed).radians),
//                            y: r1 * sin(angle(speed).radians))
//
//                }
//                Path { p in
//                    p.addArc(center: CGPoint(x: r, y: r), radius: r1 - 20, startAngle: .degrees(120), endAngle: .degrees(60), clockwise: false)
//                }
//                .stroke(gradient, style: StrokeStyle(lineWidth: 10, dash: [2, 2], dashPhase: 0))
//                Path { p in
//                    p.addArc(center: .zero, radius: 20, startAngle: .degrees(-50), endAngle: .degrees(230), clockwise: false)
//                    p.addLine(to: CGPoint(x: 0, y: -(r - 40)))
//                    p.closeSubpath()
//                    p.addEllipse(in: CGRect(x: -10, y: -10, width: 20, height: 20))
//                    p.closeSubpath()
//                }
//                .fill(style: .init(Color.primary, eoFill: true))
//                .offset(x: r, y: r)
//                .rotationEffect(angle(speed))
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .aspectRatio(1, contentMode: .fit)
//            .border(.black)
//        }
//    }
//
//    private let gradient = AngularGradient(
//        colors: [.green, .yellow, .orange, .red],
//        center: .center,
//        angle: .degrees(90)
//    )
//
//    private func angle(_ speed: Double) -> Angle {
//        Angle(degrees: (speed * 2) + 120)
//    }
//}
//
//struct CompositeSpeedo_Previews: PreviewProvider {
//    static var previews: some View {
//        CompositeSpeedo(speed: .constant(60))
//    }
//}
