//
//  BottomNavbar.swift
//  koliko+
//
//  Created by Joseph Acquah on 07/06/2026.
//


// Components/BottomNavBar.swift
import SwiftUI
 
enum NavTab {
    case films, series, home, categories, more
}
 
struct BottomNavBar: View {
    @Binding var selectedTab: NavTab
 
    var body: some View {
        HStack(spacing: 0) {
            NavBarItem(icon: "film", label: nil, tab: .films, selectedTab: $selectedTab)
            NavBarItem(icon: "rectangle.stack", label: nil, tab: .series, selectedTab: $selectedTab)
            NavBarItem(icon: "house.fill", label: "Home", tab: .home, selectedTab: $selectedTab)
            NavBarItem(icon: "squares.below.rectangle", label: nil, tab: .categories, selectedTab: $selectedTab)
            NavBarItem(icon: "ellipsis", label: nil, tab: .more, selectedTab: $selectedTab)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            Capsule()
                .fill(Color.white)
                .shadow(color: .black.opacity(0.12), radius: 20, x: 0, y: 4)
        )
        .padding(.horizontal, 24)
    }
}
 
struct NavBarItem: View {
    let icon: String
    let label: String?
    let tab: NavTab
    @Binding var selectedTab: NavTab

    var isSelected: Bool { selectedTab == tab }
    let blue = Color(red: 30/255, green: 154/255, blue: 255/255)

    var body: some View {
        Button(action: { selectedTab = tab }) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 18))
                if isSelected, let label {
                    Text(label)
                        .font(.system(size: 14, weight: .semibold))
                }
            }
            .foregroundColor(isSelected ? .white : .gray)
            .padding(.horizontal, isSelected ? 16 : 12)
            .padding(.vertical, 10)
            .background(
                Capsule().fill(isSelected ? Color.black : Color.clear)
            )
        }
        .frame(maxWidth: .infinity)
        .animation(.spring(response: 0.3), value: isSelected)
    }
}
