//
//  ImmersiveView.swift
//  VisionOSParticleEmitterBurstSample
//
//  Created by Sadao Tokuyama on 1/25/24.
//  https://twitter.com/tokufxug
//

import SwiftUI
import RealityKit

struct ImmersiveView: View {
    
    let particleEntity = Entity()
    
    var body: some View {
        RealityView { content, attachments in
            particleEntity.components.set(createParticleSystem())
             
            let anchor = AnchorEntity(.head)
            anchor.anchoring.trackingMode = .once
            particleEntity.setParent(anchor)
            particleEntity.position.z = particleEntity.position.z - 1.5
            particleEntity.position.y = particleEntity.position.y - 0.05
            if let ui = attachments.entity(for: "perticle-emitter-ui") {
                particleEntity.addChild(ui)
            }
            content.add(anchor)
        } attachments: {
             Attachment(id: "perticle-emitter-ui") {
                 Button(action: {
                     particleEntity.components[ParticleEmitterComponent.self]?.burst()
                 }) {
                     Text("Burst")
                         .font(.system(size: 80))
                         .frame(width: 500)
                         .fontWeight(.bold)
                         .padding()
                 }
             }
        }
    }
    
    func createParticleSystem() -> ParticleEmitterComponent {
        
        var particles = ParticleEmitterComponent()
        
        particles.timing = .repeating(warmUp: 0, emit: ParticleEmitterComponent.Timing.VariableDuration(duration: 1), idle: ParticleEmitterComponent.Timing.VariableDuration(duration: 1))
        
        particles.emitterShape = .box
        particles.birthLocation = .surface
        particles.emitterShapeSize = [1, 1, 1] * 0.05
        particles.burstCount = 10000
        
        particles.mainEmitter.birthRate = 1000
        
        particles.mainEmitter.size = 0.03
        particles.mainEmitter.lifeSpan = 10
        particles.mainEmitter.color =
            .evolving(start: .single(.blue), end: .single(.white))
        
        particles.mainEmitter.spreadingAngle = 1
        return particles
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
