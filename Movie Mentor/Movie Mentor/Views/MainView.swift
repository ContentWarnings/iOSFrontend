import SwiftUI

struct MainView: View {
    @State private var selectedTab = "Featured"

    var body: some View {
        TabView(selection: $selectedTab) {
            FeaturedView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Featured", systemImage: "star.fill")
                    Text("Featured")
                }
                .tag("Featured")
            SearchView()
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
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
