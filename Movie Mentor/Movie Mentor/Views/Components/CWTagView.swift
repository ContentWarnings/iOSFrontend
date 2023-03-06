import SwiftUI

struct CWTagView: View {
    @Binding var settingsChanged: Bool

    let warning: ContentWarning
    var shouldWarn: Bool {
        return warning.shouldWarn()
    }

    var body: some View {
        Text(warning.name)
            .font(Font.custom("Roboto-Bold", size: 14))
            .foregroundColor(Color("PerfectWhite"))
            .padding(5.0)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 20.0)
                    .foregroundColor(shouldWarn ? Color("Secondary") : Color("OffBlack"))
            )
            .onChange(of: settingsChanged) { _ in }
    }
}

struct CWTagView_Previews: PreviewProvider {
    static var previews: some View {
        CWTagView(settingsChanged: .constant(true), warning: ContentWarning.testData[0])
    }
}
