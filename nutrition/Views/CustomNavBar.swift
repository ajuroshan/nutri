//
//  CustomNavBar.swift
//  nutrition
//
//  Created by Ajay krishna U on 22/01/25.
//

import SwiftUI

struct CustomNavBar: View {
    @Binding var tabSelection: Int
    let tabs: [String] = ["Home", "Search", "Profile"]
    let tabIcons: [String] = ["house", "magnifyingglass", "person.circle"] // Use system or custom icons

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
            
            HStack {
                ForEach(tabs.indices, id: \.self) { index in
                    Button(action: {
                        tabSelection = index
                    }) {
                        VStack(spacing: 4) {
                            Image(systemName: tabIcons[index]) // Use SF Symbols
                                .font(.system(size: 24))
                                .foregroundColor(tabSelection == index ? .blue : .gray)
                            
                            Text(tabs[index])
                                .font(.caption)
                                .foregroundColor(tabSelection == index ? .blue : .gray)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(maxHeight: 80)
        .background(Color.white)
    }
}

#Preview {
    HomePage()
}
