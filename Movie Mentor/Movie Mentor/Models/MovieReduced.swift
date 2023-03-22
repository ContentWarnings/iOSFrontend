import Foundation

struct MovieReduced: Decodable, Identifiable {
    var id: Int
    var title: String
    var release: String
    var img: URL
    var overview: String
    var runtime: Int
    var genres: [String]
    var cw: [String]

    var releaseDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self.release) ?? Date.distantPast
    }

    var warnings: [ContentWarningReduced] {
        var array: [ContentWarningReduced] = []
        for warning in cw {
            array.append(ContentWarningReduced(name: warning))
        }

        // Return sorted array with all duplicates removed
        return Array(Set(array)).sorted()
    }

    // Returns a formatted  description string for displaying in search results
    func searchDescriptionString() -> String {
        if self.releaseDate == Date.distantPast {
            return overview
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: self.releaseDate)
        return yearString + " - " + overview
    }

    func shouldHide() -> Bool {
        for warning in self.warnings where warning.shouldHide() {
            return true
        }

        return false
    }

    func shouldWarn() -> Bool {
        for warning in self.warnings where warning.shouldWarn() {
            return true
        }

        return false
    }
}

extension MovieReduced {
    static let testData: [MovieReduced] =
    [
        MovieReduced(id: 640146,
                     title: "Ant-Man and the Wasp: Quantumania",
                     release: "2022-03-24",
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
                     cw: ["Murder"]),
        MovieReduced(id: 76600,
                     title: "Avatar: The Way of Water",
                     release: "2022-03-24",
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
                     cw: ["Kidnapping"]),
        MovieReduced(id: 315162,
                     title: "Puss in Boots: The Last Wish",
                     release: "2022-03-24",
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
                     cw: ["Drug Use"]),
        MovieReduced(id: 6401469,
                     title: "Ant-Man and the Wasp: Quantumania",
                     release: "2022-03-24",
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
                     cw: ["Murder"]),
        MovieReduced(id: 766009,
                     title: "Avatar: The Way of Water",
                     release: "2022-03-24",
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
                     cw: ["Kidnapping"]),
        MovieReduced(id: 3151629,
                     title: "Puss in Boots: The Last Wish",
                     release: "2022-03-24",
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
                     cw: ["Drug Use"])
    ]
}
