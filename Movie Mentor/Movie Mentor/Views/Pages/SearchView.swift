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
                    .padding(/*@START_MENU_TOKEN@*/.horizontal, 22.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10.0)
                LazyVStack(spacing: 0) {
                    if searchString == "" {
                        ForEach(GenreTileView.allGenreNames, id: \.self) { genre in
                            GenreTileView(genre: genre)
                            .padding(.horizontal, 24.0)
                            .padding(.vertical, 6.0)
                        }
                    } else {
                        ForEach(MovieReduced.testData) { movie in
                            VStack(spacing: 0) {
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
