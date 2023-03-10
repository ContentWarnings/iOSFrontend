import Foundation

struct MovieFull: Decodable, Identifiable {
    var id: Int
    var title: String
    var release: Date
    var img: URL
    var mpa: String
    var rating: Double
    var overview: String
    var runtime: Int
    var genres: [String]
    var warnings: [ContentWarning]
    var streamingProviders: [[String]]
    var streamingLink: URL

    func releaseDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: self.release)
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

        for warning in self.warnings where userDefaults.string(forKey: warning.name) ==
        ContentWarning.WarningSetting.hide.rawValue {
            return true
        }

        return false
    }

    func shouldWarn() -> Bool {
        let userDefaults = UserDefaults.standard

        for warning in self.warnings where userDefaults.string(forKey: warning.name) ==
        ContentWarning.WarningSetting.warn.rawValue {
            return true
        }

        return false
    }
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
                  warnings: ContentWarning.testData,
                  streamingProviders: [
                    ["Rent",
                     "https://image.tmdb.org/t/p/original/peURlLlr8jggOwK53fJ5wdQl05y.jpg"],
                    ["Rent",
                     "https://image.tmdb.org/t/p/original/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg"]],
                  streamingLink: URL(string:
                    "https://www.themoviedb.org/movie/315162-puss-in-boots-the-last-wish/watch?locale=US")!)
}
