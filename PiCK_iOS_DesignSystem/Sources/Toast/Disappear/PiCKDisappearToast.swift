import SwiftUI


public struct PiCKDisappearAlert: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isVisible = false
    
    private let successType: SuccessType
    private let message: String
    
    public init(
        successType: SuccessType,
        message: String
    ) {
        self.successType = successType
        self.message = message
    }
    
    public var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 12) {
                imageView
                    .foregroundColor(imageColor)
                
                Text(message)
                    .pickText(type: .body1, textColor: .Normal.black)
            }
            .padding(.horizontal, 16)
            .frame(height: 48)
            .background(Color.Gray.gray50)
            .cornerRadius(24)
            .padding(.bottom, 86)
            .opacity(isVisible ? 1 : 0)
            .transition(.opacity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                isVisible = true
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.easeIn(duration: 0.3)) {
                    isVisible = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    dismiss()
                }
            }
        }
    }

    private var imageView: Image {
        switch successType {
        case .success, .already:
            return PiCKImage.check
        case .fail:
            return PiCKImage.fail
        }
    }

    private var imageColor: Color {
        switch successType {
        case .success, .already:
            return .Primary.primary500
        case .fail:
            return .Error.error
        }
    }
}

public enum SuccessType {
    case success
    case fail
    case already
}

#Preview("Interactive Test") {
    TestDisappearAlertPreview()
}

struct TestDisappearAlertPreview: View {
    @State private var show = false

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            Button("토스트 띄우기") {
                show = true
            }
            .padding()
            .background(Color.blue.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .fullScreenCover(isPresented: $show) {
            PiCKDisappearAlert(
                successType: .success,
                message: "테스트 토스트입니다!"
            )
            .background(BackgroundClearView())
        }
    }
}

struct InteractivePreview: View {
    @State private var showAlert = false
    @State private var selectedType: SuccessType = .success
    @State private var selectedMessage = "외출 신청 수락이 완료되었습니다!"
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("PiCK Disappear Alert")
                    .font(.title)
                    .bold()
                
                // Type Picker
                VStack(alignment: .leading, spacing: 10) {
                    Text("Success Type")
                        .font(.headline)
                    
                    Picker("Type", selection: $selectedType) {
                        Text("Success").tag(SuccessType.success)
                        Text("Fail").tag(SuccessType.fail)
                        Text("Already").tag(SuccessType.already)
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.horizontal)
                
                // Message Picker
                VStack(alignment: .leading, spacing: 10) {
                    Text("Message")
                        .font(.headline)
                    
                    Menu {
                        Button("외출 신청 수락이 완료되었습니다!") {
                            selectedMessage = "외출 신청 수락이 완료되었습니다!"
                        }
                        Button("교실 이동 거절이 완료되었습니다!") {
                            selectedMessage = "교실 이동 거절이 완료되었습니다!"
                        }
                        Button("복귀가 완료되었습니다!") {
                            selectedMessage = "복귀가 완료되었습니다!"
                        }
                        Button("1-1의 출석 상태가 저장되었습니다.") {
                            selectedMessage = "1-1의 출석 상태가 저장되었습니다."
                        }
                        Button("버그 제보를 실패했습니다.") {
                            selectedMessage = "버그 제보를 실패했습니다."
                        }
                    } label: {
                        HStack {
                            Text(selectedMessage)
                                .lineLimit(1)
                            Spacer()
                            Image(systemName: "chevron.down")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    showAlert = true
                }) {
                    Text("Show Alert")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top, 50)
        }
        .fullScreenCover(isPresented: $showAlert) {
            PiCKDisappearAlert(
                successType: selectedType,
                message: selectedMessage
            )
            .background(BackgroundClearView())
        }
    }
}

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
