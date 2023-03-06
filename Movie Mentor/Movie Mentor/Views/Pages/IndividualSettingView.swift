import SwiftUI

struct IndividualSettingView: View {
    @Binding var settingsChanged: Bool

    private var showToggle: Binding<Bool> { Binding(
        get: { UserDefaults.standard.string(forKey: warningName) == ContentWarning.WarningSetting.show.rawValue
            || UserDefaults.standard.string(forKey: warningName) == ContentWarning.WarningSetting.warn.rawValue
        },
        set: {
            if $0 {
                UserDefaults.standard.set(ContentWarning.WarningSetting.show.rawValue, forKey: warningName)
            } else {
                UserDefaults.standard.set(ContentWarning.WarningSetting.hide.rawValue, forKey: warningName)
            }

            settingsChanged.toggle()
        })
    }
    private var warnToggle: Binding<Bool> { Binding(
        get: { UserDefaults.standard.string(forKey: warningName) == ContentWarning.WarningSetting.warn.rawValue },
        set: {
            if $0 {
                UserDefaults.standard.set(ContentWarning.WarningSetting.warn.rawValue, forKey: warningName)
            } else {
                UserDefaults.standard.set(ContentWarning.WarningSetting.show.rawValue, forKey: warningName)
            }

            settingsChanged.toggle()
        })
    }

    let warningName: String
    var warningDescription: String {
        // TODO: Replace with API call
        return "Sentence containing an explanation of the content warning. This will be fetched from API."
    }

    var body: some View {
        List {
            Section {
            } footer: {
                Text(warningDescription)
                    .font(Font.custom("Roboto-Regular", size: 16))
                    .foregroundColor(Color.primary)
            }

            Section {
                Toggle(isOn: showToggle) {
                    Text("Show Content Warning")
                        .font(Font.custom("Roboto-Regular", size: 21))
                }
            } footer: {
                Text("Decide if we should hide movies with this content warning from search and suggestions.")
                    .font(Font.custom("Roboto-Regular", size: 16))
            }

            Section {
                Toggle(isOn: warnToggle) {
                    Text("Display Warning")
                        .font(Font.custom("Roboto-Regular", size: 21))
                }
            } footer: {
                Text("Display a warning next to all movies with this content warning.")
                    .font(Font.custom("Roboto-Regular", size: 16))
            }
        }
        .navigationTitle(warningName)
    }
}

struct IndividualSettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            IndividualSettingView(settingsChanged: .constant(false), warningName: "Drug Use")
        }
    }
}
