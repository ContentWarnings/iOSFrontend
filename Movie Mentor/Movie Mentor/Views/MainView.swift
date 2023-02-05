//
//  MainView.swift
//  Movie Mentor
//
//  Created by Jacob Franz on 2/5/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            FeaturedView()
                .tabItem {
                    Label("Featured", systemImage: "star.fill")
                    Text("Featured")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                    Text("Search")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                    Text("Setting")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
