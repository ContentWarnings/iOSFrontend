import SwiftUI

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
            VStack {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .isEmpty(!hasWarning)
                        .font(.system(size:20))
                        .padding(.horizontal, 0)
                    Text(movie.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(Font.custom("Roboto-Bold", size: 22))
                        .padding(.leading, 0)
                        .lineLimit(1)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 95)
        .padding(.horizontal, 24)
        .padding(.vertical, 5)
    }
}

struct SearchMovieTileView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMovieTileView(movie: MovieReduced.testData[0])
    }
}
