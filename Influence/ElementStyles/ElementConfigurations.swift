//
//  InputStyles.swift
//  Influence
//
//  Created by Gregory Klein on 7/23/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Elemental

struct TextStyle: ElementalTextStyling {
   var font: UIFont
   var color: UIColor
   var alignment: NSTextAlignment
   
   init(size: CGFloat, weight: FontWeight, color: UIColor = UIColor(.outerSpace), alignment: NSTextAlignment = .left) {
      self.font = UIFont(size, weight)
      self.color = color
      self.alignment = alignment
   }
}

class TextConfiguration: TextElementConfiguration {
   init(size: CGFloat, weight: FontWeight, alignment: NSTextAlignment = .left, height: CGFloat? = nil) {
      super.init()
      self.textStyle = TextStyle(size: size, weight: weight, alignment: alignment)
      
      if let height = height {
         self.sizeConstraint = ElementalSize(width: .intrinsic, height: .constant(height))
      }
   }
}

class LineConfiguration: LineElementConfiguration {
   init() {
      super.init()
      sizeConstraint.height = .constant(1)
      isConfinedToMargins = false
      color = UIColor(.outerSpace, alpha: 0.2)
   }
}

class TextInputConfiguration: TextInputElementConfiguration {
   init(keyboardType: UIKeyboardType = .default, secureEntry: Bool = false, autocapitalizationType: UITextAutocapitalizationType = .none) {
      super.init(nameStyle: TextStyle(size: 12, weight: .medium),
                 placeholderStyle: TextStyle(size: 14, weight: .light, color: UIColor(.outerSpace, alpha: 0.4)),
                 inputStyle: TextStyle(size: 14, weight: .medium),
                 keyboardStyle: ElementalKeyboardStyle(type: keyboardType,
                                                       appearance: .dark,
                                                       autocapitalizationType: autocapitalizationType,
                                                       isSecureTextEntry: secureEntry),
                 inputBackgroundColor: .clear)
      isConfinedToMargins = false
      inputTintColor = UIColor(.outerSpace)
   }
}

class TitleCaseInputConfiguration: TextInputConfiguration {
   init() {
      super.init(keyboardType: .default, autocapitalizationType: .words)
   }
}

class UsernameInputConfiguration: TextInputConfiguration {
   init() {
      super.init(keyboardType: .default, autocapitalizationType: .none)
   }
}

class EmailInputConfiguration: TextInputConfiguration {
   init() {
      super.init(keyboardType: .emailAddress)
   }
}

class PasswordInputConfiguration: TextInputConfiguration {
   init() {
      super.init(secureEntry: true)
   }
}

class NumberInputConfiguration: TextInputConfiguration {
   init() {
      super.init(keyboardType: .numberPad)
   }
}

extension TextInputElementConfiguration {
   static var username: TextInputElementConfiguration {
      return UsernameInputConfiguration()
   }
}
