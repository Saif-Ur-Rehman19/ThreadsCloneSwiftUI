//
//  ThreadsTextfieldModifier.swift
//  ThreadsClone
//
//  Created by uExel on 22/07/2024.
//

import SwiftUI

struct ThreadsTextfieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.subheadline).padding(12).background(Color(.systemGray6)).cornerRadius(10)
    }
    
   
}

#Preview {
    ThreadsTextfieldModifier() as! any View
}
