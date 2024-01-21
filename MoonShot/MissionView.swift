//
//  MissionView.swift
//  MoonShot
//
//  Created by John Deranian on 1/21/24.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    //let crew: [CrewMember]
    let astronauts: [String: Astronaut]
    
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                if let date = mission.launchDate {
                    Label(date.formatted(date: .complete, time: .omitted), systemImage: "calendar")
                }
//                Text(mission.formattedLaunchDate)
//                    .foregroundStyle(.green)

                VStack(alignment: .leading) {
                    SpacerBarView()
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)

                    Text(mission.description)
                    SpacerBarView()
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                AstronautScrollView(mission: mission, astronauts: astronauts)
                
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}


#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}

// Mine was working until we add the astronauts, so going with Paul's
// he was able to use the json data, preferredColorScheme had to passed as well
//#Preview {
//    MissionView(mission: Mission.exampleMission)
//        .preferredColorScheme(.dark)
//}

// Paul's version:
//#Preview {
//    let missions: [Mission] = Bundle.main.decode("missions.json")
//
//    return MissionView(mission: missions[0])
//        .preferredColorScheme(.dark)
//}
