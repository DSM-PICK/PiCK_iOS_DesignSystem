import SwiftUI

struct PiCKErrorToast_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                Text("Main Content")
            }
            .errorToast(message: "에러가 발생했습니다", isPresented: .constant(true))
            .navigationTitle("Preview")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        PiCKImage.leftArrow 
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        
    }
}
