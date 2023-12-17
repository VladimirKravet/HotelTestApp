//
//  PhoneTextField.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 17.12.2023.
//
import Foundation
import SwiftUI



struct NumberPhoneMaskView: View {
    @EnvironmentObject private var viewModel: HotelViewModel
    
    var body: some View {
        VStack {
            let textChangeBinding = Binding<String>(
                get: {
                    FilterNumberPhone.format(with: viewModel.maskPhone, phone: viewModel.phone)
                },
                set: {
                    viewModel.phone = $0
                })
            ZStack(alignment: .leading) {
                TextFieldContainer("+7", text: textChangeBinding)
                    .font(Font.custom("SF Pro Display", size: MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16)))
                    .padding(.horizontal,MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                    .kerning(0.75)
                    .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.17))
                    .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 6, iPadValue: 6))
                    .offset(y: MyAdaptive.shared.setDynamicValue(iPhoneValue: 6, iPadValue: 6))
                Text("Номер телефона")
                    .customFont(.medium, fontSizeForiPhone: 12, fontSizeForiPad: 12)
                    .padding(.horizontal,MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                    .padding(.top, MyAdaptive.shared.setDynamicValue(iPhoneValue: 8, iPadValue: 8))
                    .kerning(0.12)
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .background(Color.clear)
                    .offset(y: MyAdaptive.shared.setDynamicValue(iPhoneValue: -16, iPadValue: -16))
            }
        }
        .frame(height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 52, iPadValue: 52))
        .background(viewModel.errorPhone ? Color(red: 0.96, green: 0.96, blue: 0.98) : Color(hex: 0xEB5757).opacity(0.15))
        .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 10, iPadValue: 10))
        
    }
}

class FilterNumberPhone: ObservableObject {
    static func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        
        for ch in mask where index < numbers.endIndex {
            if ch == "*" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}

struct TextFieldContainer: UIViewRepresentable {
    private var placeholder: String
    private var text: Binding<String>
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let innerTextField = UITextField(frame: .zero)
        innerTextField.placeholder = placeholder
        innerTextField.text = text.wrappedValue
        innerTextField.delegate = context.coordinator
        innerTextField.keyboardType = .numberPad
        
        return innerTextField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = self.text.wrappedValue
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextFieldContainer
        
        init(_ parent: TextFieldContainer) {
            self.parent = parent
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // Get the current text in the text field
            var currentText = textField.text ?? ""
            
            // Calculate the new text after applying the changes
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            // Apply the phone mask
            let maskedText = FilterNumberPhone.format(with: parent.placeholder, phone: newText)
            
            // Limit the input to the length of the mask
            if maskedText.count <= parent.placeholder.count {
                textField.text = maskedText
                parent.text.wrappedValue = newText
                return false
            }
            
            // Prevent further input if the mask is filled
            if maskedText.count == parent.placeholder.count {
                return false
            }  else {
                return true
            }
        }
    }
}
