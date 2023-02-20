import SwiftUI

struct FeaturedView: View {
    @Binding var selectedTab: String
    @Binding var searchBarFocused: Bool

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    // TODO: Replace with real API data
    let movies: [MovieReduced] = MovieReduced.testData

    var body: some View {
        ScrollView {
            VStack {
                LogoHeaderView(pageTitle: "Trending")
                    .padding(.bottom, -1.0)
                SearchBarView(searchString: .constant(""),
                              selectedTab: $selectedTab,
                              searchBarFocused: $searchBarFocused)
                    .padding(.horizontal, 22.0)
                LazyVGrid(columns: columns) {
                    ForEach(movies) { movie in
                        // TODO: Make each movie tile tappable for details
                        NavigationLink(destination: MovieDetailsView(movie: MovieFull.testData)) {
                            FeaturedMovieTileView(movie: movie)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding([.top, .leading, .trailing])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeaturedView(selectedTab: .constant("Featured"), searchBarFocused: .constant(false))
        }
    }
}
