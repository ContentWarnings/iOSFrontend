import SwiftUI

struct GenreTagView: View {
    let genre: String

    var body: some View {
        HStack {
            Image(genre.replacingOccurrences(of: " ", with: "") + "-Icon")
                .resizable()
                .scaledToFit()
                .frame(height: 14.0)
                .padding(.horizontal, 3.0)
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
        VStack {
            ForEach(GenreTileView.allGenreNames, id: \.self) { genre in
                GenreTagView(genre: genre)
            }
        }
    }
}
