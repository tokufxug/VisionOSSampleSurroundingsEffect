//
//  VisionOSSampleSurroundingsEffectApp.swift
//  VisionOSSampleSurroundingsEffect
//
//  Created by Sadao Tokuyama on 7/6/24.
//

import SwiftUI

@main
struct VisionOSSampleSurroundingsEffectApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
     }
}
