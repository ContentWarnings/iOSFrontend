//
//  SettingsView.swift
//  Movie Mentor
//
//  Created by Jacob Franz on 2/5/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Image(systemName: "gearshape.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("This tab will show the user settings!")
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
