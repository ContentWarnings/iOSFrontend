import SwiftUI

struct WarningRowView: View {
    @Environment(\.colorScheme) var colorScheme

    @Binding var settingsChanged: Bool

    let warning: ContentWarning

    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .isEmpty(!warning.shouldWarn())
                .foregroundColor(Color("PerfectWhite"))
                .background(
                    Rectangle()
                        .frame(width: 33.0, height: 33.0)
                        .foregroundColor(Color("Secondary"))
                        .cornerRadius(9)
                )
                .padding(.trailing, 10.0)
            Text(warning.name)
                .font(Font.custom("Roboto-Regular", size: 21))
            Spacer()
            Text(warning.timeSummaryString())
                .font(Font.custom("Roboto-Regular", size: 18))
                .opacity(0.5)
            Image(systemName: "chevron.right")
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 11)
                .foregroundColor(colorScheme == .dark ? Color("Dark") : Color("Light"))
        }
        .onChange(of: settingsChanged) { _ in }
    }
}

struct WarningRowView_Previews: PreviewProvider {
    static var previews: some View {
        WarningRowView(settingsChanged: .constant(false), warning: ContentWarning.testData[0])
    }
}
