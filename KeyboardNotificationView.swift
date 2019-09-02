struct KeyboardNotificationView: View {
    @ObservedObject var viewModel = DemoViewModel()
    @State private var bottomPadding: CGFloat = 0
    
    var body: some View {
        List(viewModel.rowModels, rowContent: DemoRow.init)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: bottomPadding, trailing: 0))
            .onReceive(NotificationCenter.default.publisher(for: UIWindow.keyboardWillShowNotification),
                       perform: updateFrame)
            .onReceive(NotificationCenter.default.publisher(for: UIWindow.keyboardWillHideNotification),
                       perform: updateFrame)
            .animation(.default)
    }
    
    private func updateFrame(_ notification: Notification) {
        let nsValue = (notification.userInfo?[UIWindow.keyboardFrameEndUserInfoKey] as? NSValue)
        let keyboardHeight = nsValue?.cgRectValue.height ?? 0
        if notification.name == UIWindow.keyboardWillShowNotification {
            bottomPadding = keyboardHeight
        } else {
            bottomPadding = 0
        }
    }
}