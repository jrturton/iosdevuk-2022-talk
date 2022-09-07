//
//  Symbols.swift
//  CanvasDemo
//
//  Created by Richard Turton on 28/08/2022.
//

import SwiftUI

struct Symbols: View {
    var body: some View {
        Canvas { context, size in
            let image = Image(systemName: "pencil.tip.crop.circle.badge.plus")
            context.draw(image, at: CGPoint(x: 30, y: 30))
            context.draw(image.symbolRenderingMode(.multicolor), at: CGPoint(x: 30, y: 70))
            let pencil = context.resolveSymbol(id: "pencil")!
            context.draw(pencil, at: CGPoint(x: 80, y: 30))
            context.draw(image.symbolRenderingMode(.hierarchical), at: CGPoint(x: 30, y: 130))
        } symbols: {
            Image(systemName: "pencil.tip.crop.circle.badge.plus")
                .symbolRenderingMode(.palette)
                .foregroundStyle(
                    .blue,
                    AngularGradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple], center: .center)
                )
                .tag("pencil")
        }
    }
}

struct Symbols_Previews: PreviewProvider {
    static var previews: some View {
        Symbols()
    }
}
