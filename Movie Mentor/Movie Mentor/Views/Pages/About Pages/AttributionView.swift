import SwiftUI

struct AttributionView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Attribution")
                    .font(Font.custom("Roboto-Bold", size: 32))
                Text("""
                    Source code can be found [here](https://github.com/orgs/ContentWarnings/repositories)

                    This application uses the [TMDB API](https://www.themoviedb.org/documentation/api) and \
                    [JustWatch API](https://apis.justwatch.com/docs/api/)
                    """)
                    .font(Font.custom("Roboto-Regular", size: 21))
            }
            .padding()
        }
        .navigationTitle("Attribution")
    }
}

struct AttributionView_Previews: PreviewProvider {
    static var previews: some View {
        AttributionView()
    }
}
