import SwiftUI

struct SettingsView: View {
    @Binding var selectedTab: String
    @Binding var searchBarFocused: Bool

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    SearchBarView(searchString: .constant(""),
                                  selectedTab: $selectedTab,
                                  searchBarFocused: $searchBarFocused)
                    .padding(.horizontal, 22.0)
                    .padding(.top, 10.0)
                    List {
                        SettingsRow(imageName: "exclamationmark.triangle.fill", rowText: "Content Warnings")
                        SettingsRow(imageName: "info.circle.fill", rowText: "About")
                    }
                    .frame(height: geometry.size.height - 60)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView(selectedTab: .constant("Settings"), searchBarFocused: .constant(false))
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
                .padding(.trailing, 5.0)
            Text(rowText)
        }
    }
}
