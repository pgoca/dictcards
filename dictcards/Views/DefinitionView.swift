//
//  DefinitionView.swift
//  dictcards
//
//  Created by Paweł Goca on 07/05/2021.
//

import SwiftUI
import Foundation

struct DefinitionView: View {
    var word: String
    
    init (_ wordToDefine: String) {
        self.word = wordToDefine
    }
    
    func getDefinition() -> String
    {
        let termRange = DCSGetTermRangeInString(nil, word as CFString, 0)
        let textDefinition = DCSCopyTextDefinition(nil, word as CFString, termRange)
        let textRetained = textDefinition?.takeRetainedValue()
        let text = textRetained ?? "" as CFString
        
        return text as String
    }
    
    var body: some View {
        VStack {
            Text(self.word)
            ScrollView() {
                Text(getDefinition())
            }
        }
    }
}
