//
//  HomeView.swift
//  koliko+
//
//  Created by Joseph Acquah on 07/06/2026.
//


// Screens/Home/HomeView.swift
import SwiftUI
 
// MARK: - Mock Models (replace with real models later)
struct FeaturedContent {
    let badge: String
    let category: String
    let title: String
    let episode: String
    let duration: String
    let rating: String
    let reviewCount: String
}
 
struct ContentItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let progress: Double // 0.0 - 1.0
}
 
// MARK: - HomeView
struct HomeView: View {
    @State private var selectedTab: NavTab = .home
 
    // Mock data — swap with API later
    let featured = FeaturedContent(
        badge: "NEW EPISODE",
        category: "DRAMA · SERIES",
        title: "The Chosen · Season 4",
        episode: "Episode 5",
        duration: "52 min",
        rating: "Family-friendly",
        reviewCount: "1240"
    )
 
    let continueWatching = [
        ContentItem(title: "The Chosen", subtitle: "S4 E4 · 22m left", progress: 0.6),
        ContentItem(title: "Walking by Faith", subtitle: "Ch. 7 · 14m left", progress: 0.4),
        ContentItem(title: "Risen", subtitle: "45m left", progress: 0.2),
    ]
 
    let whatsNew = [
        ContentItem(title: "New Series", subtitle: "Episode 1", progress: 0),
        ContentItem(title: "Documentary", subtitle: "Full film", progress: 0),
        ContentItem(title: "Short Film", subtitle: "22 min", progress: 0),
    ]
 
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
 
                    // MARK: Header
                    HStack {
                        Text("Koliko")
                            .font(.system(size: 24, weight: .bold))
                        + Text("+")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(red: 30/255, green: 154/255, blue: 255/255))
 
                        Spacer()
 
                        Button(action: {}) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 20))
                                .foregroundColor(.primary)
                        }
                        Button(action: {}) {
                            Image(systemName: "bell")
                                .font(.system(size: 20))
                                .foregroundColor(.primary)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
 
                    // MARK: Featured Card
                    FeaturedCard(content: featured)
 
                    // MARK: Continue Watching
                    SectionHeader(title: "Continue watching")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(continueWatching) { item in
                                ContinueWatchingCard(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
 
                    // MARK: What's New
                    SectionHeader(title: "What's new")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(whatsNew) { item in
                                NewContentCard(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
 
                    Spacer().frame(height: 100) // bottom nav breathing room
                }
            }
 
            // MARK: Bottom Nav
            BottomNavBar(selectedTab: $selectedTab)
                .padding(.bottom, 24)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
 
// MARK: - Featured Card
struct FeaturedCard: View {
    let content: FeaturedContent
    let blue = Color(red: 30/255, green: 154/255, blue: 255/255)
 
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Background — replace with AsyncImage when you have real images
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [Color(red: 0.1, green: 0.15, blue: 0.25), Color(red: 0.05, green: 0.08, blue: 0.15)],
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading
                    )
                )
                .frame(height: 360)
 
            VStack(alignment: .leading, spacing: 8) {
                // Badge
                Text(content.badge)
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Capsule().fill(blue))
 
                Spacer()
 
                Text(content.category)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(blue)
 
                Text(content.title)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
 
                Text("\(content.episode) · \(content.duration) · \(content.rating)")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.7))
 
                HStack {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(blue)
                            .font(.system(size: 12))
                        Text("(\(content.reviewCount))")
                            .font(.system(size: 13))
                            .foregroundColor(.white.opacity(0.7))
                    }
 
                    Spacer()
 
                    // Watch button
                    Button(action: {}) {
                        HStack(spacing: 6) {
                            Image(systemName: "play.fill")
                            Text("Watch")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Capsule().fill(blue))
                    }
 
                    // Bookmark button
                    Button(action: {}) {
                        Image(systemName: "bookmark")
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Circle().stroke(Color.white.opacity(0.3), lineWidth: 1))
                    }
                }
            }
            .padding(20)
        }
        .padding(.horizontal)
    }
}
 
// MARK: - Section Header
struct SectionHeader: View {
    let title: String
    let blue = Color(red: 30/255, green: 154/255, blue: 255/255)
 
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18, weight: .bold))
            Spacer()
            Button("See all") {}
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(blue)
        }
        .padding(.horizontal)
    }
}
 
// MARK: - Continue Watching Card
struct ContinueWatchingCard: View {
    let item: ContentItem
    let blue = Color(red: 30/255, green: 154/255, blue: 255/255)
 
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(red: 0.1, green: 0.15, blue: 0.25))
                    .frame(width: 200, height: 120)
 
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 36))
                    .foregroundColor(.white.opacity(0.8))
 
                // Progress bar
                VStack {
                    Spacer()
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.white.opacity(0.3))
                                .frame(height: 3)
                            Rectangle()
                                .fill(blue)
                                .frame(width: geo.size.width * item.progress, height: 3)
                        }
                    }
                    .frame(height: 3)
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
            }
            .frame(width: 200, height: 120)
 
            Text(item.title)
                .font(.system(size: 13, weight: .semibold))
            Text(item.subtitle)
                .font(.system(size: 11))
                .foregroundColor(.gray)
        }
    }
}
 
// MARK: - New Content Card
struct NewContentCard: View {
    let item: ContentItem
 
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(red: 0.12, green: 0.18, blue: 0.28))
                .frame(width: 140, height: 100)
 
            Text(item.title)
                .font(.system(size: 13, weight: .semibold))
            Text(item.subtitle)
                .font(.system(size: 11))
                .foregroundColor(.gray)
        }
    }
}
 
#Preview {
    HomeView()
}
