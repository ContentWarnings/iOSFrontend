import SwiftUI

struct SearchView: View {
    @Binding var selectedTab: String
    @Binding var searchBarFocused: Bool
    @Binding var settingsChanged: Bool

    @State private var searchString = ""

    // TODO: Add view for no more search results
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SearchBarView(searchString: $searchString,
                                  selectedTab: $selectedTab,
                                  searchBarFocused: $searchBarFocused)
                        .padding(.horizontal, 22.0)
                        .padding(.top, 10.0)
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
                                if !movie.shouldHide() {
                                    NavigationLink(destination: MovieDetailsView(settingsChanged: $settingsChanged,
                                                                                 movie: MovieFull.testData)) {
                                        VStack(spacing: 0) {
                                            SearchMovieTileView(settingsChanged: $settingsChanged, movie: movie)
                                            Separator()
                                        }
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchView(selectedTab: .constant("Search"),
                       searchBarFocused: .constant(false),
                       settingsChanged: .constant(false))
        }
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
