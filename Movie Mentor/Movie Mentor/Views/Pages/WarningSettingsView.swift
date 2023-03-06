import SwiftUI

struct WarningSettingsView: View {
    @State private var searchString = ""
    @Binding var settingsChanged: Bool

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
                SettingsSearchBarView(searchString: $searchString)
                .padding(.horizontal, 22.0)
                .padding(.top, 10.0)
                List(warningsList) { warning in
                    NavigationLink(destination: IndividualSettingView(settingsChanged: $settingsChanged,
                                                                      warningName: warning.name)) {
                        HStack {
                            Text(warning.name)
                            Spacer()
                            Text(userDefaults.string(forKey: warning.name)!)
                                .opacity(0.5)
                        }
                        .font(Font.custom("Roboto-Regular", size: 21))
                        .swipeActions {
                            Button("Hide") {
                                userDefaults.set(ContentWarning.WarningSetting.hide.rawValue, forKey: warning.name)
                                settingsChanged.toggle()
                            }
                            .tint(Color("HideAction"))

                            Button("Warn") {
                                userDefaults.set(ContentWarning.WarningSetting.warn.rawValue, forKey: warning.name)
                                settingsChanged.toggle()
                            }
                            .tint(Color("Secondary"))

                            Button("Show") {
                                userDefaults.set(ContentWarning.WarningSetting.show.rawValue, forKey: warning.name)
                                settingsChanged.toggle()
                            }
                            .tint(Color("ShowAction"))
                        }
                    }
                }
                .frame(minHeight: listHeight)
                .environment(\.defaultMinListRowHeight, 50.0)
            }
        }
        .onChange(of: settingsChanged) { _ in }
        .navigationTitle("Content Warnings")
    }
}

struct WarningSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WarningSettingsView(settingsChanged: .constant(false))
        }
    }
}
