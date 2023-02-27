import SwiftUI

struct SearchMovieTileView: View {
    let movie: MovieReduced

    @State private var hasWarning: Bool = true // TODO: Update with warning check logic

    var body: some View {
        HStack {
            // TODO: Replace with Kingfisher image
            AsyncImage(url: movie.img) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
                    .frame(width: 62.0)
            }
            .cornerRadius(4)
            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .isEmpty(!hasWarning)
                        .font(.system(size: 20))
                        .padding(.horizontal, 0.0)
                    Text(movie.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(Font.custom("Roboto-Bold", size: 22))
                        .padding(.leading, -5.0)
                        .lineLimit(1)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(movie.genres, id: \.self) { genre in
                            GenreTagView(genre: genre)
                        }
                    }
                    .frame(height: 20.0)
                    .padding(.top, 1.0)
                }
                Text(movie.searchDescriptionString())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.custom("Roboto-Regular", size: 16))
                    .opacity(0.5)
                    .lineLimit(1)
                    .padding(.top, 3.0)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(movie.warnings) { warning in
                            // TODO: Update with warning check logic
                            CWTagView(warning: warning, shouldWarn: false)
                        }
                    }
                    .frame(height: 20.0)
                    .padding(.top, 1.0)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 95.0)
        .padding(.horizontal, 24.0)
        .padding(.vertical, 10.0)
    }
}

struct SearchMovieTileView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMovieTileView(movie: MovieReduced.testData[2])
    }
}
