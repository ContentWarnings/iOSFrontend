import Foundation

struct ContentWarning: Identifiable {
    var id: String
    var name: String
    var times: [(Int, Int)]
    var description: String
}

extension ContentWarning {
    static let testData: [ContentWarning] =
    [
        ContentWarning(id: "cc8ea1b8-2155-4e35-97b5-cda4058edc0e",
                       name: "Murder",
                       times: [(1, 2), (3, 4)],
                       description: "Blue people die."),
        ContentWarning(id: "cc8ea1b8-2155-4e35-97b5-cda4058acd3",
                       name: "Kidnapping",
                       times: [(1, 2), (3, 4)],
                       description: "Blue people are kidnapped."),
        ContentWarning(id: "cc8ea1b8-2155-4e35-97b5-cda4058edabde",
                       name: "Drug Use",
                       times: [(1, 2), (3, 4)],
                       description: "Blue people use drugs.")
    ]
}

extension ContentWarning {
    enum WarningSetting: String {
        case show = "Show"
        case warn = "Warn"
        case hide = "Hide"
    }
}
