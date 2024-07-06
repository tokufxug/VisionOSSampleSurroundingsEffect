//
//  ContentView.swift
//  VisionOSSampleSurroundingsEffect
//
//  Created by Sadao Tokuyama on 7/6/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {

    var body: some View {
        VStack {
            Text("Color change by Surroundings Effect.")
            ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
