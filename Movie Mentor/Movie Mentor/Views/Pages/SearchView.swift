import SwiftUI

struct SearchView: View {
    @Binding var selectedTab: String
    
    @State private var searchString = ""

    var body: some View {
        ScrollView {
            VStack {
                LogoHeaderView(pageTitle: "Search")
                    .padding(.bottom, -1.0)
                SearchBarView(searchString: $searchString, selectedTab: $selectedTab)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal, 22.0/*@END_MENU_TOKEN@*/)
                LazyVStack(spacing: 0) {
                    ForEach(GenreTileView.allGenreNames, id: \.self) { genre in
                        GenreTileView(genre: genre)
                        .padding(.horizontal, 24.0)
                        .padding(.vertical, 6.0)
                    }
                }
                
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(selectedTab: .constant("Search"))
    }
}
