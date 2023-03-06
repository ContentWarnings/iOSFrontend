import SwiftUI

struct SearchBarView: View {
    @Binding var searchString: String
    @FocusState private var fieldIsFocused: Bool
    @Binding var selectedTab: String
    @Binding var searchBarFocused: Bool

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .tint(Color("SearchBarText"))
                .opacity(0.3)
            TextField("Search All Movies", text: $searchString)
                .font(Font.custom("Roboto-Regular", size: 18))
                .focused($fieldIsFocused)
                .onChange(of: fieldIsFocused) { isFocused in
                    searchBarFocused = isFocused

                    // Hide keyboard and navigate to search tab if not there
                    if isFocused && selectedTab != "Search" {
                        UIApplication.shared.sendAction(
                            #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        selectedTab = "Search"
                    }
                }
        }
        .padding(10.0)
        .background(RoundedRectangle(cornerRadius: 11 ).fill(Color("SearchBarBackground")).opacity(0.24))
        .onAppear {
            fieldIsFocused = searchBarFocused
        }
    }
}

struct SettingsSearchBarView: View {
    @Binding var searchString: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .tint(Color("SearchBarText"))
                .opacity(0.3)
            TextField("Search All Content Warnings", text: $searchString)
                .font(Font.custom("Roboto-Regular", size: 18))
        }
        .padding(10.0)
        .background(RoundedRectangle(cornerRadius: 11 ).fill(Color("SearchBarBackground")).opacity(0.24))
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SearchBarView(searchString: .constant(""),
                          selectedTab: .constant("Search"),
                          searchBarFocused: .constant(false))
                .frame(width: 343.0, height: 37.0)
            SettingsSearchBarView(searchString: .constant(""))
                .frame(width: 343.0, height: 37.0)
        }
    }
}
