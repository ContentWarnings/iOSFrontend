import SwiftUI

struct GenreTileView: View {
    let genre: String
    
    var body: some View {
        ZStack {
            Image("Action")
                .resizable()
                .scaledToFill()
                .frame(height: 90.0)
                .clipped()
                .cornerRadius(11)
                .allowsHitTesting(false)
            Rectangle()
                .frame(height: 90.0)
                .foregroundColor(Color("OLEDDark").opacity(0.75))
                .cornerRadius(11)
            Text(genre)
                .font(Font.custom("Roboto-Bold", size: 42))
                .foregroundColor(Color("PerfectWhite"))
        }
    }
}

struct GenreTileView_Previews: PreviewProvider {
    static var previews: some View {
        GenreTileView(genre: "Action")
    }
}

extension GenreTileView {
    static let allGenreNames =
    [
        "Action",
        "Adventure",
        "Animation",
        "Comedy",
        "Crime",
        "Documentary",
        "Drama",
        "Family",
        "Fantasy",
        "History",
        "Horror",
        "Music",
        "Mystery",
        "Romance",
        "Science Fiction",
        "TV Movie",
        "Thriller",
        "War",
        "Western"
    ]
}
