import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            // TODO: Replace with actual content
            Image(systemName: "gearshape.fill")
                .imageScale(.large)
                .foregroundColor(Color("Secondary"))
            Text("This tab will show the user settings!")
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
