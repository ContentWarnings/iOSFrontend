import SwiftUI

struct MainView: View {
    @State private var selectedTab = "Featured"
    @State private var searchBarFocused = false

    var body: some View {
        TabView(selection: $selectedTab) {
            FeaturedView(selectedTab: $selectedTab, searchBarFocused: $searchBarFocused)
                .tabItem {
                    Label("Featured", systemImage: "star.fill")
                    Text("Featured")
                }
                .tag("Featured")
            SearchView(selectedTab: $selectedTab, searchBarFocused: $searchBarFocused)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                    Text("Search")
                }
                .tag("Search")
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                    Text("Setting")
                }
                .tag("Settings")
        }
        .tint(Color("Primary"))
        .onChange(of: selectedTab) { newTab in
            // Unfocus search bar if leaving search tab
            if newTab != "Search" {
                searchBarFocused = false
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
