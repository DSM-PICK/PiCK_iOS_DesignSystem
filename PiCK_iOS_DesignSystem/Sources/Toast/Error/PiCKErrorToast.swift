import SwiftUI

public struct PiCKErrorToast: View {
    public var message: String
    @Binding public var isPresented: Bool
    
    @State private var offset: CGFloat = -100
    @State private var opacity: Double = 0
    
    public init(
        message: String,
        isPresented: Binding<Bool>
    ) {
        self.message = message
        self._isPresented = isPresented
    }
    
    public var body: some View {
        HStack(spacing: 12) {
            Image("fail", bundle: .module)
                .foregroundColor(.Error.error)
            
            Text(message)
                .pickText(type: .body1, textColor: .Normal.black)
        }
        .padding(.horizontal, 16)
        .frame(height: 48)
        .background(Color.Gray.gray50)
        .cornerRadius(24)
        .offset(y: offset)
        .opacity(opacity)
        .onAppear {
            showToast()
        }
    }
    
    private func showToast() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0)) {
            offset = 0
            opacity = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            hideToast()
        }
    }
    
    private func hideToast() {
        withAnimation(.easeIn(duration: 0.3)) {
            offset = -100
            opacity = 0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isPresented = false
        }
    }
}

public extension View {
    func errorToast(message: String, isPresented: Binding<Bool>) -> some View {
        ZStack {
            self
            
            if isPresented.wrappedValue {
                VStack {
                    PiCKErrorToast(message: message, isPresented: isPresented)
                        .padding(.top, 8)
                    
                    Spacer()
                }
                .transition(.opacity)
            }
        }
    }
}
