import SwiftUI

struct StreamingTileView: View {
    let streamType: String
    let providerImage: URL
    let streamingLink: URL

    var body: some View {
        Link(destination: streamingLink) {
            VStack {
                // TODO: Replace with Kingfisher image
                AsyncImage(url: providerImage) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                        .frame(width: 60.0, height: 60.0)
                }
                .frame(width: 60.0, height: 60.0)
                .cornerRadius(12)
                Text(streamType)
                    .font(Font.custom("Roboto-Regular", size: 16))
                    .foregroundColor(.primary)
            }
        }
    }
}

struct StreamingTileView_Previews: PreviewProvider {
    static var previews: some View {
        StreamingTileView(streamType: MovieFull.testData.streamingProviders[0].0,
                          providerImage: MovieFull.testData.streamingProviders[0].1,
                          streamingLink: MovieFull.testData.streamingLink)
    }
}
