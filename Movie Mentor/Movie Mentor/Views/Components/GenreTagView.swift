import SwiftUI

struct GenreTagView: View {
    let genre: String

    var body: some View {
        HStack {
            Circle()
                .frame(width: 10.0, height: 10.0)
                .foregroundColor(Color("PerfectWhite"))
                .padding(.leading, 8.0)
            Text(genre)
                .font(Font.custom("Roboto-Regular", size: 14))
                .foregroundColor(Color("PerfectWhite"))
                .padding(.trailing, 8.0)
                .padding(.leading, -5.0)
        }
        .background(
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 20.0)
                .foregroundColor(Color("OffBlack"))
        )
    }
}

struct GenreTagView_Previews: PreviewProvider {
    static var previews: some View {
        GenreTagView(genre: "Action")
    }
}
