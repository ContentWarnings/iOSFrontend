import SwiftUI

struct WarningSettingsView: View {
    let userDefaults = UserDefaults.standard
    var warningsList: [ContentWarning] {
        return ContentWarning.testData.sorted { // TODO: Replace with full list from API
            $0.name < $1.name
        }
    }
    var listHeight: CGFloat {
        return 50.0 * CGFloat(warningsList.count) + 75.0
    }

    var body: some View {
        ScrollView {
            VStack {
                SearchBarView(searchString: .constant(""),
                              selectedTab: .constant(""),
                              searchBarFocused: .constant(false))
                .padding(.horizontal, 22.0)
                .padding(.top, 10.0)
                List(warningsList) { warning in
                    NavigationLink(destination: Text("Test")) {
                        HStack {
                            Text(warning.name)
                            Spacer()
                            Text(userDefaults.string(forKey: warning.name)!)
                                .opacity(0.5)
                        }
                        .font(Font.custom("Roboto-Regular", size: 21))
                    }
                }
                .frame(minHeight: listHeight)
                .environment(\.defaultMinListRowHeight, 50.0)
            }
        }
    }
}

struct WarningSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WarningSettingsView()
        }
    }
}
