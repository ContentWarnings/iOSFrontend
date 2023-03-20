import Alamofire
import SwiftUI

struct SearchView: View {
    @Binding var selectedTab: String
    @Binding var searchBarFocused: Bool
    @Binding var settingsChanged: Bool

    @State var searchString: String = ""

    @ObservedObject var viewModel: SearchViewModel

    init(selectedTab: Binding<String>,
         searchBarFocused: Binding<Bool>,
         settingsChanged: Binding<Bool>) {
        self._selectedTab = selectedTab
        self._searchBarFocused = searchBarFocused
        self._settingsChanged = settingsChanged
        self.viewModel = SearchViewModel(query: "")
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SearchBarView(searchString: $searchString,
                                  selectedTab: $selectedTab,
                                  searchBarFocused: $searchBarFocused)
                        .padding(.horizontal, 22.0)
                        .padding(.top, 10.0)
                        .onChange(of: searchString) { newValue in
                            Alamofire.Session.default.session.getAllTasks { tasks in
                                tasks.forEach { $0.cancel() }
                            }
                            viewModel.query = newValue
                            viewModel.performSearch()
                        }
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
                            if viewModel.isDoneLoading {
                                ForEach(viewModel.searchResults) { movie in
                                    if !movie.shouldHide() {
                                        NavigationLink(destination: NavigationLazyView(
                                            MovieDetailsView(settingsChanged: $settingsChanged,
                                                             movieId: movie.id, movieTitle: movie.title))) {
                                            VStack(spacing: 0) {
                                                SearchMovieTileView(settingsChanged: $settingsChanged, movie: movie)
                                                Separator()
                                            }
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                                SearchMovieTileView.FinalSearchTile()
                            } else {
                                ProgressView()
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
