import Kingfisher
import SwiftUI

struct FeaturedMovieTileView: View {
    let movie: MovieReduced

    var body: some View {
        VStack {
            KFImage(movie.img)
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .scaledToFit()
                .frame(height: 240.0)
                .cornerRadius(14)
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
