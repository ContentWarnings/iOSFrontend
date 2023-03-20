import Kingfisher
import SwiftUI

struct MovieDetailsView: View {
    @Binding var settingsChanged: Bool

    let movieId: Int
    let movieTitle: String

    @ObservedObject var viewModel: MovieDetailsViewModel

    init(settingsChanged: Binding<Bool>, movieId: Int, movieTitle: String) {
        self._settingsChanged = settingsChanged
        self.movieId = movieId
        self.movieTitle = movieTitle
        self.viewModel = MovieDetailsViewModel(movieId: movieId)
    }

    var body: some View {
        ScrollView {
            if viewModel.isDoneLoading {
                VStack(alignment: .leading, spacing: 0) {
                    WarningBannerView()
                        .isEmpty(!viewModel.movie.shouldWarn())
                    HStack(alignment: .top) {
                        KFImage(viewModel.movie.img)
                            .placeholder {
                                ProgressView()
                            }
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                            .padding(.trailing, 17.0)
                        VStack(alignment: .leading) {
                            Group {
                                Text(viewModel.movie.releaseDateString())
                                Text(viewModel.movie.runtimeString())
                            }
                            .font(Font.custom("Roboto-Regular", size: 18))
                            .opacity(0.5)
                            ForEach(viewModel.movie.genres, id: \.self) { genre in
                                GenreTagView(genre: genre)
                            }
                            StarRatingView(rating: viewModel.movie.rating)
                                .padding(.top, 1.0)
                        }
                    }
                    .frame(height: 260.0)
                    .padding(.top, 24.0)
                    .padding(.horizontal, 25.0)
                    .padding(.bottom)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewModel.movie.streamingProviders, id: \.self) { provider in
                                StreamingTileView(streamType: provider[0],
                                                  providerImage: URL(string: provider[1])!,
                                                  streamingLink: viewModel.movie.streamingLink)
                            }
                        }
                    }
                    .padding(.horizontal, 25.0)
                    .padding(.bottom)
                    MPARatingView(rating: viewModel.movie.mpa)
                        .padding(.bottom)
                    Text("Summary")
                        .font(Font.custom("Roboto-Bold", size: 32))
                        .padding(.horizontal, 25.0)
                    Text(viewModel.movie.overview)
                        .font(Font.custom("Roboto-Regular", size: 21))
                        .padding(.horizontal, 25.0)
                        .padding(.bottom)
                    Text("Content Warnings")
                        .font(Font.custom("Roboto-Bold", size: 32))
                        .padding(.horizontal, 25.0)
                        .padding(.bottom, 6.0)
                    if viewModel.movie.cw.count == 0 {
                        Text("No warnings submitted for this movie.")
                            .font(Font.custom("Roboto-Regular", size: 21))
                            .padding(.horizontal, 25.0)
                    } else {
                        LazyVStack {
                            ForEach(viewModel.movie.cw.sorted()) { warning in
                                NavigationLink(destination: NavigationLazyView(WarningDetailsView(warning: warning))) {
                                    WarningRowView(settingsChanged: $settingsChanged, warning: warning)
                                        .padding(.horizontal, 25.0)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
        .navigationTitle(movieTitle)
        .onChange(of: settingsChanged) { _ in } // Used to refresh view on settings change
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailsView(settingsChanged: .constant(false),
                             movieId: MovieFull.testData.id,
                             movieTitle: MovieFull.testData.title)
        }
    }
}
