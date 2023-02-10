import SwiftUI

struct FeaturedMovieTileView: View {
    let movie: MovieReduced

    var body: some View {
        VStack {
            AsyncImage(url: movie.img) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 240.0)
            .cornerRadius(14.0)
            Text(movie.title)
                .font(Font.custom("Roboto-Medium", size: 22))
                .lineLimit(2)
        }
        .frame(width: 160.0)
    }
}

struct FeaturedMovieTileView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedMovieTileView(movie: MovieReduced.testData[0])
    }
}
