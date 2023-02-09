import SwiftUI

struct SearchBarView: View {
    @Binding var searchString: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .tint(Color("SearchBarText"))
                .opacity(0.3)
            TextField("Search All Movies", text: $searchString)
                .font(Font.custom("Roboto-Regular", size: 18))
        }
        .padding(10.0)
        .background(RoundedRectangle(cornerRadius: 11 ).fill(Color("SearchBarBackground")).opacity(0.24))
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchString: .constant(""))
            .frame(width: 343.0, height: 37.0)
    }
}
