//
//  GridModifierView.swift
//  MoonShot
//
//  Created by John Deranian on 1/24/24.
//

import SwiftUI

struct GridModifierView: View {
    
    let mission: Mission
    
    var body: some View {
        
        VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(.rect(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
        
    }
    
    
}

#Preview {
    GridModifierView(mission: Mission.exampleMission)
}
