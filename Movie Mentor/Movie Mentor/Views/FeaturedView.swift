import SwiftUI

struct FeaturedView: View {
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
                SearchBarView(searchString: .constant(""))
                    .padding(/*@START_MENU_TOKEN@*/.horizontal, 22.0/*@END_MENU_TOKEN@*/)
                LazyVGrid(columns: columns) {
                    ForEach(movies) { movie in
                        FeaturedMovieTileView(movie: movie)
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
    }
}
