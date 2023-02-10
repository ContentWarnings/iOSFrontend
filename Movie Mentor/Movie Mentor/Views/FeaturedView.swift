import SwiftUI

struct FeaturedView: View {
    @Binding var selectedTab: String

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let height: CGFloat = 300
    let movies: [MovieReduced] = MovieReduced.testData

    var body: some View {
        ScrollView {
            VStack {
                LogoHeaderView(pageTitle: "Trending")
                    .padding(.bottom, -1.0)
                SearchBarView(searchString: .constant(""), selectedTab: $selectedTab)
                    .padding(.horizontal, 22.0)
                LazyVGrid(columns: columns) {
                    ForEach(movies) { movie in
                        FeaturedMovieTileView(movie: movie)
                    }
                }
                .padding([.top, .leading, .trailing])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView(selectedTab: .constant("Featured"))
    }
}
