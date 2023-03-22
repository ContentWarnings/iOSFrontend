import SwiftUI

struct FeaturedView: View {
    @Binding var selectedTab: String
    @Binding var searchBarFocused: Bool
    @Binding var settingsChanged: Bool
    @Binding var selectedGenre: String
    @Binding var selectedSort: String

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    @StateObject var viewModel = FeaturedViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SearchBarView(searchString: .constant(""),
                                  selectedTab: $selectedTab,
                                  searchBarFocused: $searchBarFocused,
                                  selectedGenre: $selectedGenre,
                                  selectedSort: $selectedSort)
                        .padding(.horizontal, 22.0)
                        .padding(.top, 10.0)
                    if viewModel.isDoneLoading {
                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.movies) { movie in
                                if !movie.shouldHide() {
                                    NavigationLink(destination: NavigationLazyView(
                                        MovieDetailsView(settingsChanged: $settingsChanged,
                                                         movieId: movie.id,
                                                         movieTitle: movie.title))) {
                                        FeaturedMovieTileView(movie: movie)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                        .padding([.top, .leading, .trailing])
                    } else {
                        ProgressView()
                            .frame(height: 100.0)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    LogoHeaderView(pageTitle: selectedTab)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeaturedView(selectedTab: .constant("Featured"),
                         searchBarFocused: .constant(false),
                         settingsChanged: .constant(false),
                         selectedGenre: .constant("Any"),
                         selectedSort: .constant("Relevance"))
        }
    }
}
