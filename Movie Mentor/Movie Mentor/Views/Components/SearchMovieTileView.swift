import SwiftUI

struct SearchMovieTileView: View {
    let movie: MovieReduced
    
    @State private var hasWarning: Bool = true

    var body: some View {
        HStack {
            AsyncImage(url: movie.img) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
                    .frame(width: 62)
            }
            .cornerRadius(4)
            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .isEmpty(!hasWarning)
                        .font(.system(size:20))
                        .padding(.horizontal, 0)
                    Text(movie.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(Font.custom("Roboto-Bold", size: 22))
                        .padding(.leading, -5)
                        .lineLimit(1)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack() {
                        ForEach(movie.genres, id: \.self) { genre in
                            GenreTagView(genre: genre)
                        }
                    }
                    .frame(height: 20)
                    .padding(.top, 1)
                }
                Text(movie.searchDescriptionString())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.custom("Roboto-Regular", size: 16))
                    .opacity(0.5)
                    .lineLimit(1)
                    .padding(.top, 3)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack() {
                        ForEach(movie.cw, id: \.self) { cw in
                            CWTagView(warningName: cw, shouldWarn: false)
                        }
                    }
                    .frame(height: 20)
                    .padding(.top, 1)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 95)
        .padding(.horizontal, 24)
        .padding(.vertical, 10)
    }
}

struct SearchMovieTileView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMovieTileView(movie: MovieReduced.testData[2])
    }
}

struct EmptyModifier: ViewModifier {
    let isEmpty: Bool
    
    func body(content: Content) -> some View {
        Group {
            if isEmpty {
                EmptyView()
            } else {
                content
            }
        }
    }
}

extension View {
    func isEmpty(_ bool: Bool) -> some View {
        modifier(EmptyModifier(isEmpty: bool))
    }
}
