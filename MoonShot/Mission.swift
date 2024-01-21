//
//  Mission.swift
//  MoonShot
//
//  Created by John Deranian on 1/21/24.
//

import Foundation

//struct CrewRole: Codable {
//    let name: String
//    let role: String
//}

struct Mission: Codable, Identifiable, Hashable {
    
//    static func == (lhs: Mission, rhs: Mission) -> Bool {
//        lhs.id == rhs.id && lhs.crew == rhs.crew
//    }
    
    
    
    struct CrewRole: Codable, Hashable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? ""
    }
    
    
    static let exampleMission = Mission(id: 7, launchDate: Date() , crew: [CrewRole(name: "Glen", role: "Mission Commander")], description: "Test")
}

//extension Mission: Hashable {
//        static func == (lhs: Self, rhs: Self) -> Bool {
//            lhs.uid == rhs.uid
//        }
//        func hash(into hasher: inout Hasher) {
//            hasher.combine(uid)
//        }
//    }
