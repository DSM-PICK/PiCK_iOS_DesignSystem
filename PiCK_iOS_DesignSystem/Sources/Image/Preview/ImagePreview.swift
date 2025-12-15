
import SwiftUI

#if os(iOS)
struct ImagePreview: View {
    private struct NamedImage: Identifiable {
        let id = UUID()
        let name: String
        let image: Image
    }

    private let images: [NamedImage] = [
        NamedImage(name: "onboardingLogo", image: PiCKImage.onboardingLogo),
        NamedImage(name: "pickLogo", image: PiCKImage.pickLogo),
        NamedImage(name: "alert", image: PiCKImage.alert),
        NamedImage(name: "bottomArrow", image: PiCKImage.bottomArrow),
        NamedImage(name: "bug", image: PiCKImage.bug),
        NamedImage(name: "calendar", image: PiCKImage.calendar),
        NamedImage(name: "changePassword", image: PiCKImage.changePassword),
        NamedImage(name: "check", image: PiCKImage.check),
        NamedImage(name: "classRoomMove", image: PiCKImage.classRoomMove),
        NamedImage(name: "defaultTimeTable1", image: PiCKImage.defaultTimeTable1),
        NamedImage(name: "displayMode", image: PiCKImage.displayMode),
        NamedImage(name: "earlyLeave", image: PiCKImage.earlyLeave),
        NamedImage(name: "eyeOff", image: PiCKImage.eyeOff),
        NamedImage(name: "eyeOn", image: PiCKImage.eyeOn),
        NamedImage(name: "fail", image: PiCKImage.fail),
        NamedImage(name: "image", image: PiCKImage.image),
        NamedImage(name: "leftArrow", image: PiCKImage.leftArrow),
        NamedImage(name: "logout", image: PiCKImage.logout),
        NamedImage(name: "main", image: PiCKImage.main),
        NamedImage(name: "myPage", image: PiCKImage.myPage),
        NamedImage(name: "navigationSetting", image: PiCKImage.navigationSetting),
        NamedImage(name: "newNotice", image: PiCKImage.newNotice),
        NamedImage(name: "notice", image: PiCKImage.notice),
        NamedImage(name: "outing", image: PiCKImage.outing),
        NamedImage(name: "profile", image: PiCKImage.profile),
        NamedImage(name: "rightArrow", image: PiCKImage.rightArrow),
        NamedImage(name: "smile", image: PiCKImage.smile),
        NamedImage(name: "studentIdCard", image: PiCKImage.studentIdCard),
        NamedImage(name: "time", image: PiCKImage.time),
        NamedImage(name: "topArrow", image: PiCKImage.topArrow),
        NamedImage(name: "voice", image: PiCKImage.voice),
        NamedImage(name: "weekendMeal", image: PiCKImage.weekendMeal),
        NamedImage(name: "allTabIcon", image: PiCKImage.allTabIcon),
        NamedImage(name: "applyIcon", image: PiCKImage.applyIcon),
        NamedImage(name: "homeIcon", image: PiCKImage.homeIcon),
        NamedImage(name: "scheduleIcon", image: PiCKImage.scheduleIcon),
        NamedImage(name: "schoolMealIcon", image: PiCKImage.schoolMealIcon),
        NamedImage(name: "blackLogo", image: PiCKImage.blackLogo),
        NamedImage(name: "moveClass", image: PiCKImage.moveClass)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(images) { namedImage in
                    VStack {
                        namedImage.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        Text(namedImage.name)
                            .font(.caption)
                    }
                    .padding()
                }
            }
        }
    }
}

struct ImagePreview_Previews: PreviewProvider {
    static var previews: some View {
        ImagePreview()
    }
}
#endif
