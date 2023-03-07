import SwiftUI

struct WarningDetailsView: View {
    let warning: ContentWarning

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text(warning.allTimesString())
                        .font(Font.custom("Roboto-Bold", size: 50))
                    Spacer()
                }
                .padding(.top)
                Text("Summary")
                    .font(Font.custom("Roboto-Bold", size: 32))
                Text(warning.description)
                    .font(Font.custom("Roboto-Regular", size: 21))
                    .padding(.bottom)
                Text("Submit Feedback")
                    .font(Font.custom("Roboto-Bold", size: 32))
                Button(action: {}, label: { // TODO: Conect to API
                    HStack {
                        Image(systemName: "checkmark")
                            .font(.system(size: 40))
                        Spacer()
                        Text("This was accurate.")
                            .font(Font.custom("Roboto-Regular", size: 26))
                        Spacer()
                    }
                    .foregroundColor(Color("PerfectWhite"))
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 11)
                            .foregroundColor(Color("ShowAction"))
                    }
                })
                .buttonStyle(.plain)
                Button(action: {}, label: { // TODO: Connect to API
                    HStack {
                        Image(systemName: "xmark")
                            .font(.system(size: 40))
                        Spacer()
                        Text("This was inaccurate.")
                            .font(Font.custom("Roboto-Regular", size: 26))
                        Spacer()
                    }
                    .foregroundColor(Color("PerfectWhite"))
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 11)
                            .foregroundColor(Color("HideAction"))
                    }
                })
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 25.0)
        }
        .navigationTitle("CW: " + warning.name)
    }
}

struct WarningDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WarningDetailsView(warning: ContentWarning.testData[0])
        }
    }
}
