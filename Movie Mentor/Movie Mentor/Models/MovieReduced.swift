import Foundation

struct MovieReduced: Identifiable {
    var id: Int
    var title: String
    var release: Date
    var img: URL
    var overview: String
    var runtime: Int
    var genres: [String]
    var warnings: [String] // TODO: Update to content warning objects

    // Returns a formatted  description string for displaying in search results
    func searchDescriptionString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: self.release)
        return yearString + " - " + overview
    }
}

extension MovieReduced {
    static let testData: [MovieReduced] =
    [
        MovieReduced(id: 640146,
                     title: "Ant-Man and the Wasp: Quantumania",
                     release: Date.now,
                     img: URL(string: "https://image.tmdb.org/t/p/original/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg")!,
                     overview: """
                     Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents \
                     Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the \
                     Quantum Realm, interacting with strange new creatures and embarking on an adventure that will \
                     push them beyond the limits of what they thought possible.
                     """,
                     runtime: 125,
                     genres: ["Adventure",
                             "Science Fiction",
                             "Comedy"],
                     warnings: ["Kidnapping", "Drug Use"]),
        MovieReduced(id: 76600,
                     title: "Avatar: The Way of Water",
                     release: Date.now,
                     img: URL(string: "https://image.tmdb.org/t/p/original/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg")!,
                     overview: """
                     Set more than a decade after the events of the first film, learn the story of the Sully family \
                     (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep \
                     each other safe, the battles they fight to stay alive, and the tragedies they endure.
                     """,
                     runtime: 192,
                     genres: ["Science Fiction",
                             "Adventure",
                             "Action"],
                     warnings: ["Terrorism", "Death"]),
        MovieReduced(id: 315162,
                     title: "Puss in Boots: The Last Wish",
                     release: Date.now,
                     img: URL(string: "https://image.tmdb.org/t/p/original/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,
                     overview: """
                     Puss in Boots discovers that his passion for adventure has taken its toll: He has burned \
                     through eight of his nine lives, leaving him with only one life left. Puss sets out on an \
                     epic journey to find the mythical Last Wish and restore his nine lives.
                     """,
                     runtime: 103,
                     genres: ["Animation",
                             "Adventure",
                             "Comedy",
                             "Family",
                             "Fantasy"],
                     warnings: ["Violence", "Abuse"]),
        MovieReduced(id: 6401469,
                     title: "Ant-Man and the Wasp: Quantumania",
                     release: Date.now,
                     img: URL(string: "https://image.tmdb.org/t/p/original/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg")!,
                     overview: """
                     Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents \
                     Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the \
                     Quantum Realm, interacting with strange new creatures and embarking on an adventure that will \
                     push them beyond the limits of what they thought possible.
                     """,
                     runtime: 125,
                     genres: ["Adventure",
                             "Science Fiction",
                             "Comedy"],
                     warnings: ["Kidnapping", "Drug Use"]),
        MovieReduced(id: 766009,
                     title: "Avatar: The Way of Water",
                     release: Date.now,
                     img: URL(string: "https://image.tmdb.org/t/p/original/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg")!,
                     overview: """
                     Set more than a decade after the events of the first film, learn the story of the Sully family \
                     (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep \
                     each other safe, the battles they fight to stay alive, and the tragedies they endure.
                     """,
                     runtime: 192,
                     genres: ["Science Fiction",
                             "Adventure",
                             "Action"],
                     warnings: ["Terrorism", "Death"]),
        MovieReduced(id: 3151629,
                     title: "Puss in Boots: The Last Wish",
                     release: Date.now,
                     img: URL(string: "https://image.tmdb.org/t/p/original/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,
                     overview: """
                     Puss in Boots discovers that his passion for adventure has taken its toll: He has burned \
                     through eight of his nine lives, leaving him with only one life left. Puss sets out on an \
                     epic journey to find the mythical Last Wish and restore his nine lives.
                     """,
                     runtime: 103,
                     genres: ["Animation",
                             "Adventure",
                             "Comedy",
                             "Family",
                             "Fantasy"],
                     warnings: ["Violence", "Abuse"])
    ]
}
