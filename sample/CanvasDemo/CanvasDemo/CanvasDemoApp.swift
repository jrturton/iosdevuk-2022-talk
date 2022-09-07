//
//  CanvasDemoApp.swift
//  CanvasDemo
//
//  Created by Richard Turton on 26/04/2022.
//

import SwiftUI

@main
struct CanvasDemoApp: App {
    var body: some Scene {
        WindowGroup {
            CanvasSpeedo(speed: 60)
        }
    }
}
