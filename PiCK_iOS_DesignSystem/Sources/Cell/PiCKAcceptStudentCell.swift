import SwiftUI

public struct PiCKAcceptStudentCell: View {
    public var studentNumber: String
    public var studentName: String
    public var startTime: String
    public var endTime: String
    public var activityType: String
    public var reason: String
    public var isSelected: Bool
    public var onTap: () -> Void

    public init(
        studentNumber: String,
        studentName: String,
        startTime: String,
        endTime: String,
        activityType: String,
        reason: String,
        isSelected: Bool = false,
        onTap: @escaping () -> Void
    ) {
        self.studentNumber = studentNumber
        self.studentName = studentName
        self.startTime = startTime
        self.endTime = endTime
        self.activityType = activityType
        self.reason = reason
        self.isSelected = isSelected
        self.onTap = onTap
    }

    public var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 12) {
                    Text("\(studentNumber) \(studentName)")
                        .pickText(type: .subTitle3, textColor: .Normal.black)

                    Text("\(startTime) - \(endTime) (\(activityType))")
                        .pickText(type: .label2, textColor: .Gray.gray900)
                }
                .padding(.top, 12)
                .padding(.horizontal, 16)

                Text(reason)
                    .pickText(type: .body2, textColor: .Normal.black)
                    .padding(.top, 8)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(minHeight: 79)
            .background(Color.Gray.gray50)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, lineWidth: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }

    private var borderColor: Color {
        isSelected ? .Primary.primary500 : .clear
    }
}
