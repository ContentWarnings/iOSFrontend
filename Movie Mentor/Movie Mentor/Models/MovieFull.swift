import Foundation

struct MovieFull: Decodable, Identifiable {
    var id: Int
    var title: String
    var release: String
    var img: URL
    var mpa: String
    var rating: Double
    var overview: String
    var runtime: Int
    var genres: [String]
    var cw: [ContentWarning]
    var streaming_info: StreamingInfo?

    var streamingProviders: [[String]] {
        var array: [[String]] = []

        for provider in self.streaming_info?.providers ?? [] {
            let string = provider[0].components(separatedBy: "- ")[1].capitalized
            array.append(Array([string, provider[1]]))
        }

        return array
    }

    var streamingLink: URL {
        return self.streaming_info?.tmdb_link ?? StreamingInfo.testData.tmdb_link
    }

    var releaseDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self.release)!
    }

    func releaseDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: self.releaseDate)
    }

    func runtimeString() -> String {
        let numHours = self.runtime / 60
        let numMinutes = self.runtime % 60
        var str = ""

        if numHours > 0 {
            str += numHours.description + "hr "
        }
        if numMinutes > 0 {
            str += numMinutes.description + "min"
        }

        return str
    }

    func shouldHide() -> Bool {
        let userDefaults = UserDefaults.standard

        for warning in self.cw where userDefaults.string(forKey: warning.name) ==
        ContentWarning.WarningSetting.hide.rawValue {
            return true
        }

        return false
    }

    func shouldWarn() -> Bool {
        let userDefaults = UserDefaults.standard

        for warning in self.cw where userDefaults.string(forKey: warning.name) ==
        ContentWarning.WarningSetting.warn.rawValue {
            return true
        }

        return false
    }
}

struct StreamingInfo: Decodable {
    var providers: [[String]]
    var tmdb_link: URL
}

extension MovieFull {
    static let testData: MovieFull =
        MovieFull(id: 640146,
                  title: "Ant-Man and the Wasp: Quantumania",
                  release: "2022-03-24",
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
                  cw: ContentWarning.testData,
                  streaming_info: StreamingInfo.testData)
}

extension StreamingInfo {
    static let testData: StreamingInfo =
        StreamingInfo(providers: [
          ["Rent",
           "https://image.tmdb.org/t/p/original/peURlLlr8jggOwK53fJ5wdQl05y.jpg"],
          ["Rent",
           "https://image.tmdb.org/t/p/original/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg"]],
                      tmdb_link: URL(string:
                        "https://www.themoviedb.org/movie/315162-puss-in-boots-the-last-wish/watch?locale=US")!)
}
