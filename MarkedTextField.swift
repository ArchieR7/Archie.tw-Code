
import SwiftUI
import UIKit

struct MarkedTextField: UIViewRepresentable {
    @Binding var text: String
    private let textField = UITextField(frame: .zero)
    
    init(_ localizedStringKey: String, text: Binding<String>) {
        _text = text
        textField.placeholder = localizedStringKey
        textField.borderStyle = .roundedRect
    }
    
    func makeUIView(context: UIViewRepresentableContext<MarkedTextField>) -> UITextField {
        textField.delegate = context.coordinator
        return textField
    }
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<MarkedTextField>) {}
    func makeCoordinator() -> Coordinator { Coordinator(self) }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var markedTextField: MarkedTextField
        
        init(_ markedTextField: MarkedTextField) {
            self.markedTextField = markedTextField
            super.init()
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(Self.textDidchange(_:)),
                                                   name: UITextField.textDidChangeNotification,
                                                   object: markedTextField.textField)
        }
        
        deinit {
            NotificationCenter.default.removeObserver(self)
        }
        
        @objc private func textDidchange(_ notification: Notification) {
            let textField = markedTextField.textField
            if textField.markedTextRange == nil {
                markedTextField.text = textField.text ?? String()
            }
        }
    }
}
