//
//  GridLayoutView.swift
//  MoonShot
//
//  Created by John Deranian on 1/22/24.
//

import SwiftUI

struct GridLayoutView: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    //@State private var path = NavigationPath()
    
    //@Binding var path
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        GridModifierView(mission: mission)
                    }
                    //                        .navigationDestination(for: Mission.self) { mission in
                    //                            MissionView(mission:mission, astronauts: astronauts)
                    //                        }
                }
            }
            .padding([.horizontal, .bottom])
            
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return GridLayoutView(astronauts: astronauts, missions: missions)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
