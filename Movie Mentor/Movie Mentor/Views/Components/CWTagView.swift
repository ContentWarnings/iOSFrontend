import SwiftUI

struct CWTagView: View {
    let warningName: String
    let shouldWarn: Bool
    
    var body: some View {
        Text(warningName)
            .font(Font.custom("Roboto-Bold", size: 14))
            .foregroundColor(Color("PerfectWhite"))
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(shouldWarn ? Color("Secondary") : Color("OffBlack"))
            )
    }
}

struct CWTagView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CWTagView(warningName: "Kidnapping", shouldWarn: true)
            CWTagView(warningName: "Drug Use", shouldWarn: false)
        }
    }
}
