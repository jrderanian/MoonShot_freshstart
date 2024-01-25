//
//  ListLayoutView.swift
//  MoonShot
//
//  Created by John Deranian on 1/22/24.
//

import SwiftUI

struct ListLayoutView: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    //@State private var path = NavigationPath()
    
    var body: some View {
        
        List{
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    // cleaned up this view by taking HStack out
                    ListModifierView(mission: mission)
                    //MissionView(mission: mission, astronauts: astronauts)
                }
                .listRowBackground(Color.darkBackground)
            }
        }
        .listStyle(.plain)
        //            .navigationDestination(for: Mission.self) { mission in
        //                MissionView(mission: mission, astronauts: astronauts)
        //            }
    }
}

#Preview {
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    
    return ListLayoutView(astronauts: astronauts, missions: missions)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
