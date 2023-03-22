import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Privacy Policy")
                    .font(Font.custom("Roboto-Bold", size: 32))
                Text("""
                    Overall our goal is to reduce tracking and data storage on users to promote a safe environment \
                    for all users.
                    """)
                    .font(Font.custom("Roboto-Regular", size: 21))
                Text("Tracking and Data Storage")
                    .font(Font.custom("Roboto-Bold", size: 24))
                    .padding(.top)
                Text("""
                    For users who do not have an account:

                    There is minimal data tracking which primarily includes data collected by CloudFlare such as \
                    which pages are accessed, how many requests are made, how many unique users are visiting, and the \
                    country of origin of said users.

                    For users with an account:

                    Data related to your account such as your email and login credentials, as well as content \
                    warnings you have submitted are securely stored. These are availible for your viewing discretion \
                    in your profile and can be exported there.

                    For your safety, your content warnings are NOT stored on MovieMentor's servers, rather saved in \
                    your browser on your local machine.

                    In compliance with regulations such as those presented by the General Data Protection Regulation \
                    (GDPR) and California Consumer Protection Act (CCPA), all data is secured and monitored for \
                    potential data breaches. Additionally users are provided with the option to delete their account \
                    including all data stored, as well as export all of the data stored on an individual.
                    """)
                    .font(Font.custom("Roboto-Regular", size: 21))
                Text("Legal Compliance")
                    .font(Font.custom("Roboto-Bold", size: 24))
                    .padding(.top)
                Text("""
                    MovieMentor reserves the right to give any data to law enforcement given a proper warrent is \
                    issued. MovieMentor is based in the United States of America, as is CloudFlare, GitHub, and \
                    Amazon Web Services. As of 2023-03-11 MovieMentor has not shared any data with the authorities.
                    """)
                    .font(Font.custom("Roboto-Regular", size: 21))
            }
            .padding()
        }
        .navigationTitle("Privacy Policy")
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
