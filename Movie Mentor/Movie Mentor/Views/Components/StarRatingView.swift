import SwiftUI

struct StarRatingView: View {
    let rating: Double

    var body: some View {
        HStack(spacing: 0) {
            if rating < 1.5 {
                HalfStarView()
            } else {
                FullStarView()
            }

            if rating < 2.5 {
                EmptyStarView()
            } else if rating < 3.5 {
                HalfStarView()
            } else {
                FullStarView()
            }

            if rating < 4.5 {
                EmptyStarView()
            } else if rating < 5.5 {
                HalfStarView()
            } else {
                FullStarView()
            }

            if rating < 6.5 {
                EmptyStarView()
            } else if rating < 7.5 {
                HalfStarView()
            } else {
                FullStarView()
            }

            if rating < 8.5 {
                EmptyStarView()
            } else if rating < 9.5 {
                HalfStarView()
            } else {
                FullStarView()
            }
        }
        .font(.system(size: 20))
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Movie Rating")
        .accessibilityValue(rating.description)
    }
}

struct EmptyStarView: View {
    var body: some View {
        Image(systemName: "star")
    }
}

struct HalfStarView: View {
    var body: some View {
        Image(systemName: "star.leadinghalf.filled")
    }
}

struct FullStarView: View {
    var body: some View {
        Image(systemName: "star.fill")
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(rating: 8.7)
    }
}
