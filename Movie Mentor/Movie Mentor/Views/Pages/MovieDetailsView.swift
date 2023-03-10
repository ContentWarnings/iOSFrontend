import Kingfisher
import SwiftUI

struct MovieDetailsView: View {
    @Binding var settingsChanged: Bool

    let movie: MovieFull

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                WarningBannerView()
                    .isEmpty(!movie.shouldWarn())
                HStack(alignment: .top) {
                    KFImage(movie.img)
                        .placeholder {
                            ProgressView()
                        }
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
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
                .padding(.top, 24.0)
                .padding(.horizontal, 25.0)
                .padding(.bottom)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(movie.streamingProviders, id: \.self) { provider in
                            StreamingTileView(streamType: provider[0],
                                              providerImage: URL(string: provider[1])!,
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
                    .padding(.bottom, 6.0)
                LazyVStack {
                    ForEach(movie.warnings.sorted()) { warning in
                        NavigationLink(destination: WarningDetailsView(warning: warning)) {
                            WarningRowView(settingsChanged: $settingsChanged, warning: warning)
                                .padding(.horizontal, 25.0)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .navigationTitle(movie.title)
        .onChange(of: settingsChanged) { _ in } // Used to refresh view on settings change
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailsView(settingsChanged: .constant(false), movie: MovieFull.testData)
        }
    }
}
