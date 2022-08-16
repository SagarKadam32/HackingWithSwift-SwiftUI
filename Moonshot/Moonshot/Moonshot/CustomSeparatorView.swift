//
//  CustomSeparatorView.swift
//  Moonshot
//
//  Created by Sagar Kadam on 16/08/22.
//

import SwiftUI

struct CustomSeparatorView: View {
    var body: some View {
        Rectangle()
            .frame(height:2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct CustomSeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSeparatorView()
    }
}
