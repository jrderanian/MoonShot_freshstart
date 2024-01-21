//
//  SpacerBarView.swift
//  MoonShot
//
//  Created by John Deranian on 1/21/24.
//

import SwiftUI

struct SpacerBarView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    SpacerBarView()
}
