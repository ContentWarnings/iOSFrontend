import SwiftUI

struct SearchView: View {
    @Binding var selectedTab: String
    @Binding var searchBarFocused: Bool

    @State private var searchString = ""

    var body: some View {
        ScrollView {
            VStack {
                LogoHeaderView(pageTitle: "Search")
                    .padding(.bottom, -1.0)
                SearchBarView(searchString: $searchString,
                              selectedTab: $selectedTab,
                              searchBarFocused: $searchBarFocused)
                    .padding(.horizontal, 22.0)
                    .padding(.bottom, 10.0)
                LazyVStack(spacing: 0) {
                    if searchString == "" {
                        // Display genre tiles if user hasn't searched yet
                        ForEach(GenreTileView.allGenreNames, id: \.self) { genre in
                            // TODO: Make each tile tappable to search genre
                            GenreTileView(genre: genre)
                            .padding(.horizontal, 24.0)
                            .padding(.vertical, 6.0)
                        }
                    } else {
                        // Once user has searched, replace genre tiles with movie tiles
                        // TODO: Replace with real API data
                        ForEach(MovieReduced.testData) { movie in
                            VStack(spacing: 0) {
                                // TODO: Make each tile tappable for movie details
                                SearchMovieTileView(movie: movie)
                                Separator()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(selectedTab: .constant("Search"), searchBarFocused: .constant(false))
    }
}

struct Separator: View {
    var body: some View {
        Rectangle()
            .frame(height: 1.0)
            .opacity(0.2)
            .padding(.horizontal, 24)
    }
}
