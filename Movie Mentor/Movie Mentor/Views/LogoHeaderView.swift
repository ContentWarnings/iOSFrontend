import SwiftUI

struct LogoHeaderView: View {
    let pageTitle: String
    
    var body: some View {
        HStack {
            Image(decorative: "Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 32.0)
            Text(pageTitle)
                .font(Font.custom("Roboto-Bold", size: 32))
                .padding(.top, 6.0)
            Spacer()
        }
        .padding(.leading, 24.0)
    }
}

struct LogoHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LogoHeaderView(pageTitle: "Trending")
    }
}
