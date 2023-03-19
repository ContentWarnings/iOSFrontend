import Foundation

struct ContentWarning: Comparable, Decodable, Identifiable {
    var id: String
    var name: String
    var time: [[Int]]
    var desc: String

    // Sorted alphabetically with 'warn' warnings first
    static func < (lhs: ContentWarning, rhs: ContentWarning) -> Bool {
        let firstShouldWarn = lhs.shouldWarn()
        let secondShouldWarn = rhs.shouldWarn()

        if firstShouldWarn && !secondShouldWarn {
            return true
        } else if !firstShouldWarn && secondShouldWarn {
            return false
        } else {
            return lhs.name < rhs.name
        }
    }

    static func == (lhs: ContentWarning, rhs: ContentWarning) -> Bool {
        return lhs.id == rhs.id
    }

    // Returns a formatted string for a given pair of start and end times
    static func timeString(startTime: Int, endTime: Int) -> String {
        let startHour = startTime / 60
        let startMinute = String(format: "%02d", startTime % 60)
        let endHour = endTime / 60
        let endMinute = String(format: "%02d", endTime % 60)

        return "\(startHour):\(startMinute) - \(endHour):\(endMinute)"
    }

    func shouldHide() -> Bool {
        return UserDefaults.standard.string(forKey: self.name) == ContentWarning.WarningSetting.hide.rawValue
    }

    func shouldWarn() -> Bool {
        return UserDefaults.standard.string(forKey: self.name) == ContentWarning.WarningSetting.warn.rawValue
    }

    // Returns a formatted string for use in MovieDetailsView
    func timeSummaryString() -> String {
        if self.time.count > 1 {
            return "Multiple Instances"
        } else {
            return ContentWarning.timeString(startTime: self.time[0][0], endTime: self.time[0][1])
        }
    }

    // Returns a formatted string for all times for use in WarningDetailsView
    func allTimesString() -> String {
        var res = ""

        for time in self.time {
            res += ContentWarning.timeString(startTime: time[0], endTime: time[1]) + "\n"
        }

        return res
    }
}

extension ContentWarning {
    static let testData: [ContentWarning] =
    [
        ContentWarning(id: "cc8ea1b8-2155-4e35-97b5-cda4058edc0e",
                       name: "Murder",
                       time: [[1, 2], [3, 4]],
                       desc: "Blue people die."),
        ContentWarning(id: "cc8ea1b8-2155-4e35-97b5-cda4058acd3",
                       name: "Kidnapping",
                       time: [[3, 4]],
                       desc: "Blue people are kidnapped."),
        ContentWarning(id: "cc8ea1b8-2155-4e35-97b5-cda4058edabde",
                       name: "Drug Use",
                       time: [[92, 128]],
                       desc: "Blue people use drugs.")
    ]
}

extension ContentWarning {
    enum WarningSetting: String {
        case show = "Show"
        case warn = "Warn"
        case hide = "Hide"
    }
}
