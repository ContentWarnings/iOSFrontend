import SwiftUI

struct CWTagView: View {
    let warning: ContentWarning
    let shouldWarn: Bool

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
    }
}

struct CWTagView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CWTagView(warning: ContentWarning.testData[0], shouldWarn: true)
            CWTagView(warning: ContentWarning.testData[1], shouldWarn: false)
        }
    }
}
