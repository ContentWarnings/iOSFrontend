import SwiftUI

struct MovieDetailsView: View {
    let movie: MovieFull

    var body: some View {
        Text(movie.title)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: MovieFull.testData)
    }
}
