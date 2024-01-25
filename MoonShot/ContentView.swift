//
//  ContentView.swift
//  MoonShot
//
//  Created by John Deranian on 1/21/24.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    // was a @State var but now the app remembers the state, another Paulism
    //another comment
    //boo
    @AppStorage("showingGrid") private var viewGrid = true
    
    //Paul never used the navigationPath for this project.
    var body: some View {
        NavigationStack {
            Group {
                if viewGrid {
                    GridLayoutView(astronauts: astronauts, missions: missions)
                }
                else {
                    ListLayoutView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    viewGrid.toggle()
                } label: {
                    if viewGrid {
                        Label("Show as table", systemImage: "list.dash")
                    } else {
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    }
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}

