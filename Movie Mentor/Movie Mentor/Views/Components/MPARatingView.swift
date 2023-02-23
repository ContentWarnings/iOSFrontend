import SwiftUI

struct MPARatingView: View {
    let rating: String
    var description: String {
        switch rating {
        case "G":
            return "General Audiences"
        case "PG":
            return "Parental Guidance Suggested"
        case "PG-13":
            return "Parents Strongly Cautioned"
        case "R":
            return "Restricted"
        case "NC-17":
            return "Adults Only"
        default:
            return "Rating Unknown"
        }
    }

    var body: some View {
        HStack {
            Text(rating)
                .font(Font.custom("Roboto-Bold", size: 28))
                .padding(8.0)
                .border(.primary, width: 3)
                .cornerRadius(3)
            Text(description)
                .font(Font.custom("Roboto-Regular", size: 21))
            Spacer()
        }
        .padding(.horizontal, 25.0)
    }
}

struct MPARatingView_Previews: PreviewProvider {
    static var previews: some View {
        MPARatingView(rating: "PG-13")
    }
}
