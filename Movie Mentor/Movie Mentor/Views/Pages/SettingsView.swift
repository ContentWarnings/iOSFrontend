import SwiftUI

struct SettingsView: View {
    @Binding var selectedTab: String
    @Binding var searchBarFocused: Bool
    @Binding var settingsChanged: Bool
    @Binding var selectedGenre: String
    @Binding var selectedSort: String

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        SearchBarView(searchString: .constant(""),
                                      selectedTab: $selectedTab,
                                      searchBarFocused: $searchBarFocused,
                                      selectedGenre: $selectedGenre,
                                      selectedSort: $selectedSort)
                        .padding(.horizontal, 22.0)
                        .padding(.top, 10.0)
                        List {
                            NavigationLink(destination: NavigationLazyView(
                                WarningSettingsView(settingsChanged: $settingsChanged))) {
                                SettingsRow(imageName: "exclamationmark.triangle.fill", rowText: "Content Warnings")
                            }
                            // TODO: Create about page
                            SettingsRow(imageName: "info.circle.fill", rowText: "About")
                        }
                        .frame(height: geometry.size.height - 60)
                        .environment(\.defaultMinListRowHeight, 50.0)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    LogoHeaderView(pageTitle: selectedTab)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView(selectedTab: .constant("Settings"),
                         searchBarFocused: .constant(false),
                         settingsChanged: .constant(false),
                         selectedGenre: .constant("Any"),
                         selectedSort: .constant("Relevance"))
        }
    }
}

struct SettingsRow: View {
    let imageName: String
    let rowText: String

    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(Color("PerfectWhite"))
                .background(
                    Rectangle()
                        .frame(width: 33.0, height: 33.0)
                        .foregroundColor(Color("Primary"))
                        .cornerRadius(9)
                )
                .padding(.trailing, 10.0)
            Text(rowText)
                .font(Font.custom("Roboto-Regular", size: 21))
        }
    }
}
