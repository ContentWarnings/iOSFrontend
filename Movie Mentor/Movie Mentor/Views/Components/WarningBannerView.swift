import SwiftUI

struct WarningBannerView: View {
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 36))
                .padding(.leading, 20)
                .padding(.trailing, 15)
            VStack(alignment: .leading) {
                Text("Proceed with caution.")
                    .font(Font.custom("Roboto-Bold", size: 24))
                Text("This contains material you previously flagged.")
                    .font(Font.custom("Roboto-Regular", size: 14))
            }
            Spacer()
        }
        .foregroundColor(Color("PerfectWhite"))
        .frame(height: 67.0)
        .frame(maxWidth: .infinity)
        .background(
            Rectangle()
                .foregroundColor(Color("Secondary"))
        )
    }
}

struct WarningBannerView_Previews: PreviewProvider {
    static var previews: some View {
        WarningBannerView()
    }
}
