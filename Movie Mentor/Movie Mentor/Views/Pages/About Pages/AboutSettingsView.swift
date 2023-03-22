import SwiftUI

struct AboutSettingsView: View {
    var body: some View {
            List {
            NavigationLink(destination: Text("Test")) {
                SettingsRow(imageName: "info.circle.fill", rowText: "About")
            }
            NavigationLink(destination: Text("Test")) {
                SettingsRow(imageName: "app.connected.to.app.below.fill", rowText: "Attribution")
            }
            NavigationLink(destination: Text("Test")) {
                SettingsRow(imageName: "hand.raised.fill", rowText: "Privacy Policy")
            }
            NavigationLink(destination: Text("Test")) {
                SettingsRow(imageName: "doc.text.fill", rowText: "Terms of Service")
            }
        }
        .environment(\.defaultMinListRowHeight, 50.0)
    }
}

struct AboutSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutSettingsView()
    }
}
