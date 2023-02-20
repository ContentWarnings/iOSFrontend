import SwiftUI

struct MovieDetailsView: View {
    let movie: MovieFull
    
    @State private var hasWarning: Bool = true // TODO: Update with warning check logic

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                WarningBannerView()
                    .isEmpty(!hasWarning)
                    .padding(.bottom, 24.0)
                HStack(alignment: .top) {
                    // TODO: Replace with Kingfisher image
                    AsyncImage(url: movie.img) { image in
                        image.resizable().scaledToFit()
                            .cornerRadius(12)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 170.0)
                    }
                    .padding(.trailing, 17.0)
                    VStack(alignment: .leading) {
                        Group {
                            Text(movie.releaseDateString())
                            Text(movie.runtimeString())
                        }
                        .font(Font.custom("Roboto-Regular", size: 18))
                        .opacity(0.5)
                        ForEach(movie.genres, id: \.self) { genre in
                            GenreTagView(genre: genre)
                        }
                        StarRatingView(rating: movie.rating)
                            .padding(.top, 1.0)
                    }
                }
                .frame(height: 260.0)
                .padding(.horizontal, 25.0)
            }
        }
        .navigationTitle(movie.title)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailsView(movie: MovieFull.testData)
        }
    }
}
