import SwiftUI

struct SearchView: View {
    @State private var searchString = ""

    var body: some View {
        VStack {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .foregroundColor(Color("Secondary"))
            Text("This tab will allow for movie searching!")
        }
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
