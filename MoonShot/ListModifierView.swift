//
//  ListModifierView.swift
//  MoonShot
//
//  Created by John Deranian on 1/24/24.
//

import SwiftUI

struct ListModifierView: View {
    let mission: Mission
    var body: some View {
        
        HStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
            
            
            Text(mission.displayName)
                .font(.headline)
                .foregroundStyle(.white)
            Text(mission.formattedLaunchDate)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.6))
        }
    }
}

#Preview {
    ListModifierView(mission: Mission.exampleMission)
}
