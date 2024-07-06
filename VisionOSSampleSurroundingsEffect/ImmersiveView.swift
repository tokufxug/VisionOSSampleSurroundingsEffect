//
//  ImmersiveView.swift
//  VisionOSSampleSurroundingsEffect
//
//  Created by Sadao Tokuyama on 7/6/24.
//

import SwiftUI
import RealityKit

struct ImmersiveView: View {

    @State private var color = Color.red
    @State private var colorIndex = 0
    private let colors: [Color] = [
            .red, .blue, .green, .yellow, .orange, .purple, .pink, .cyan,
            .black, .brown, .indigo
    ]

    var body: some View {
        RealityView { content in
            if let entity = try? await Entity(named: "pancakes") {
                entity.position.y = 1.0
                entity.position.z = -1.5
                entity.scale*=5
                entity.components.set(PointLightComponent(color: .white))
                content.add(entity)
            }
        }
        .preferredSurroundingsEffect(
            SurroundingsEffect.colorMultiply(color))
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                var nextIndex = Int.random(in: 0..<colors.count)
                if colorIndex == nextIndex {
                    nextIndex = nextIndex + 1 >= colors.count ? 0 : nextIndex + 1
                }
                colorIndex = nextIndex
                withAnimation(.easeInOut(duration: 1.0)) {
                    color = colors[nextIndex]
                }
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
