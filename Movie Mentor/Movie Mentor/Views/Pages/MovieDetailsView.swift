import SwiftUI

struct MovieDetailsView: View {
    let movie: MovieFull

    @State private var hasWarning: Bool = true // TODO: Update with warning check logic

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
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
                .padding(.bottom)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(movie.streamingProviders, id: \.1) { provider in
                            StreamingTileView(streamType: provider.0,
                                              providerImage: provider.1,
                                              streamingLink: movie.streamingLink)
                        }
                    }
                }
                .padding(.horizontal, 25.0)
                .padding(.bottom)
                MPARatingView(rating: movie.mpa)
                    .padding(.bottom)
                Text("Summary")
                    .font(Font.custom("Roboto-Bold", size: 32))
                    .padding(.horizontal, 25.0)
                Text(movie.overview)
                    .font(Font.custom("Roboto-Regular", size: 21))
                    .padding(.horizontal, 25.0)
                    .padding(.bottom)
                Text("Content Warnings")
                    .font(Font.custom("Roboto-Bold", size: 32))
                    .padding(.horizontal, 25.0)
                // TODO: Display content warnings here
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
