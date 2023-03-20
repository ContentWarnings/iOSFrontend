import SwiftUI

struct SearchSheetView: View {
    @Binding var selectedGenre: String
    @Binding var selectedSort: String
    @Binding var showingSheet: Bool

    var genres: [String] {
        var array = GenreTileView.allGenreNames
        array.insert("None", at: 0)
        return array
    }

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("Filter By Genre")
                    .font(Font.custom("Roboto-Bold", size: 32))
                    .padding(.top, 25.0)
                Picker(selection: $selectedGenre, label: Text("Filter")) {
                    ForEach(genres, id: \.self) { genre in
                        Text(genre)
                    }
                }
                .pickerStyle(.wheel)
                Text("Sort By")
                    .font(Font.custom("Roboto-Bold", size: 32))
                    .padding(.top, 25.0)
                Picker(selection: $selectedSort, label: Text("Sort")) {
                    ForEach(SearchViewModel.searchOptionNames, id: \.self) { sort in
                        Text(sort)
                    }
                }
                .pickerStyle(.wheel)
                Button {
                    showingSheet.toggle()
                } label: {
                    Text("Search")
                        .font(Font.custom("Roboto-Regular", size: 28))
                        .padding(.top, 20.0)
                }
            }
        }
    }
}

struct SearchSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSheetView(selectedGenre: .constant("None"),
                        selectedSort: .constant("Relevance"),
                        showingSheet: .constant(true))
    }
}
