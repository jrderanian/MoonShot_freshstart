//
//  AstronautScrollView.swift
//  MoonShot
//
//  Created by John Deranian on 1/21/24.
//

import SwiftUI

struct AstronautScrollView: View {
    
    let mission: Mission
    let crew: [CrewMember]
    
    // doing to crewmember calculations here, not sure I would have done this.
    struct CrewMember: Hashable {
        let role: String
        let astronaut: Astronaut
    }
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink(value: crewMember.astronaut) {
                        //AstronautView(astronaut: crewMember.astronaut)
                        //Text("Astronaut details")
                        
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationDestination(for: Astronaut.self){ astronaut in
            AstronautView(astronaut: astronaut)
        }
        
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

//#Preview {
//    AstronautScrollView()
//}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautScrollView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
