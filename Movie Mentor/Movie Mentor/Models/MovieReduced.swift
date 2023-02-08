import Foundation

struct MovieReduced {
    var id: Int
    var title: String
    var release: Date
    var img: URL
    var mpa: String
    var rating: Double
}

extension MovieReduced {
    static let testData: [MovieReduced] =
    [
        MovieReduced(id: 640146,
                     title: "Ant-Man and the Wasp: Quantumania",
                     release: Date.now,
                     img: URL(string: "https://image.tmdb.org/t/p/original/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg")!,
                     mpa: "PG-13",
                     rating: 7.6),
        MovieReduced(id: 76600,
                     title: "Avatar: The Way of Water",
                     release: Date.now,
                     img: URL(string: "https://image.tmdb.org/t/p/original/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg")!,
                     mpa: "Unknown",
                     rating: 7.744),
        MovieReduced(id: 315162,
                     title: "Puss in Boots: The Last Wish",
                     release: Date.now,
                     img: URL(string: "https://image.tmdb.org/t/p/original/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,
                     mpa: "PG",
                     rating: 8.561)
    ]
}
