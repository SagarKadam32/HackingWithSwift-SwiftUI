//
//  TitleHeaderView.swift
//  Moonshot
//
//  Created by Sagar Kadam on 16/08/22.
//

import SwiftUI

struct TitleHeaderView: View {
    var headerTitle: String
    var headerFont: Font
    var body: some View {
        Text(headerTitle)
            .font(headerFont)
            .padding(.bottom, 5)
    }
}

struct TitleHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TitleHeaderView(headerTitle: "Title", headerFont: .title.bold())
    }
}
