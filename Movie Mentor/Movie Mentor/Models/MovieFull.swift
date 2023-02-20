import Foundation

struct MovieFull: Identifiable {
    var id: Int
    var title: String
    var release: Date
    var img: URL
    var mpa: String
    var rating: Float
    var overview: String
    var runtime: Int
    var genres: [String]
    var warnings: [String] // TODO: Update to content warning objects
    var streamingProviders: [(String, URL)]
    var streamingLink: URL
}

extension MovieFull {
    static let testData: MovieFull =
        MovieFull(id: 640146,
                  title: "Ant-Man and the Wasp: Quantumania",
                  release: Date.now,
                  img: URL(string: "https://image.tmdb.org/t/p/original/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg")!,
                  mpa: "PG-13",
                  rating: 6.6,
                  overview: """
                  Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne \
                  and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, \
                  interacting with strange new creatures and embarking on an adventure that will push them beyond \
                  the limits of what they thought possible.
                  """,
                  runtime: 125,
                  genres: ["Adventure", "Science Fiction", "Comedy"],
                  warnings: ["Kidnapping", "Drug Use"],
                  streamingProviders: [
                    ("Apple TV - rent",
                     URL(string: "https://image.tmdb.org/t/p/original/peURlLlr8jggOwK53fJ5wdQl05y.jpg")!),
                    ("Amazon Video - rent",
                     URL(string: "https://image.tmdb.org/t/p/original/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg")!)],
                  streamingLink: URL(string:
                    "https://www.themoviedb.org/movie/315162-puss-in-boots-the-last-wish/watch?locale=US")!)
}