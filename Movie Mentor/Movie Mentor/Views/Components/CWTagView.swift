import SwiftUI

struct CWTagView: View {
    @Binding var settingsChanged: Bool

    let warning: ContentWarningReduced

    var body: some View {
        Text(warning.name)
            .font(Font.custom("Roboto-Bold", size: 14))
            .foregroundColor(Color("PerfectWhite"))
            .padding(5.0)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 20.0)
                    .foregroundColor(warning.shouldWarn() ? Color("Secondary") : Color("OffBlack"))
            )
            .onChange(of: settingsChanged) { _ in } // Used to refresh view on settings change
    }
}

struct CWTagView_Previews: PreviewProvider {
    static var previews: some View {
        CWTagView(settingsChanged: .constant(true), warning: ContentWarningReduced.testData[0])
    }
}
