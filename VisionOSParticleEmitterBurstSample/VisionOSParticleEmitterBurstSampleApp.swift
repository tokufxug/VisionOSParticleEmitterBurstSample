//
//  VisionOSParticleEmitterBurstSampleApp.swift
//  VisionOSParticleEmitterBurstSample
//
//  Created by Sadao Tokuyama on 1/25/24.
//

import SwiftUI

@main
struct VisionOSParticleEmitterBurstSampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
