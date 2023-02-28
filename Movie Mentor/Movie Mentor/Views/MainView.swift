import SwiftUI

struct MainView: View {
    @State private var selectedTab = "Featured"
    @State private var searchBarFocused = false

    init(selectedTab: String = "Featured", searchBarFocused: Bool = false) {
        self.selectedTab = selectedTab
        self.searchBarFocused = searchBarFocused

        // Fixes an iOS 15+ bug with navigation bar appearance
        // Will be updated if I find a better fix
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithDefaultBackground()
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }

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
            SettingsView(selectedTab: $selectedTab, searchBarFocused: $searchBarFocused)
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
