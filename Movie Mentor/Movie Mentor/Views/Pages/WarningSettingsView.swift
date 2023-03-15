import SwiftUI

struct WarningSettingsView: View {
    @State private var searchString = ""
    @Binding var settingsChanged: Bool
    @ObservedObject var viewModel = WarningSettingsViewModel()

    let userDefaults = UserDefaults.standard

    var body: some View {
        List {
            Section {
            } footer: {
                // TODO: Make settings search functional
                SettingsSearchBarView(searchString: $searchString)
                .padding(.top, 10.0)
            }

            if viewModel.isDoneLoading {
                ForEach(viewModel.warningNames, id: \.self) { warning in
                    NavigationLink(destination: NavigationLazyView(
                        IndividualSettingView(settingsChanged: $settingsChanged,
                                              warningName: warning))) {
                        HStack {
                            Text(warning)
                            Spacer()
                            Text(userDefaults.string(forKey: warning)!)
                                .opacity(0.5)
                        }
                        .font(Font.custom("Roboto-Regular", size: 21))
                        .swipeActions {
                            Button("Hide") {
                                userDefaults.set(ContentWarning.WarningSetting.hide.rawValue, forKey: warning)
                                settingsChanged.toggle()
                            }
                            .tint(Color("HideAction"))

                            Button("Warn") {
                                userDefaults.set(ContentWarning.WarningSetting.warn.rawValue, forKey: warning)
                                settingsChanged.toggle()
                            }
                            .tint(Color("Secondary"))

                            Button("Show") {
                                userDefaults.set(ContentWarning.WarningSetting.show.rawValue, forKey: warning)
                                settingsChanged.toggle()
                            }
                            .tint(Color("ShowAction"))
                        }
                    }
                }
                .environment(\.defaultMinListRowHeight, 50.0)
            } else {
                ProgressView()
            }
        }
        .onChange(of: settingsChanged) { _ in } // Used to refresh view on settings change
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
