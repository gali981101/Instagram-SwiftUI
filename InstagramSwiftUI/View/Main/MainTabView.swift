//
//  MainTabView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/22.
//

import SwiftUI

enum Tab: Int {
    case home
    case search
    case upload
    case notifications
    case profile
}

struct MainTabView: View {
    
    @State private var selectedTab: Tab = .home
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance
            .stackedLayoutAppearance
            .normal
            .iconColor = .label
        
        appearance
            .stackedLayoutAppearance
            .normal
            .titleTextAttributes = [
                .foregroundColor: UIColor.label
            ]
        
        appearance
            .stackedLayoutAppearance
            .selected
            .iconColor = .label
        
        appearance
            .stackedLayoutAppearance
            .selected
            .titleTextAttributes = [
                .foregroundColor: UIColor.label
            ]
        
        UITabBar
            .appearance()
            .standardAppearance = appearance
        
        UITabBar
            .appearance()
            .scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                
                FeedView()
                    .tabItem {
                        Label("", systemImage: "house")
                            .environment(
                                \.symbolVariants,
                                 selectedTab == .home ? .fill : .none
                            )
                    }
                    .tag(Tab.home)
                
                SearchView()
                    .tabItem {
                        Label("", systemImage: "magnifyingglass.circle")
                            .environment(
                                \.symbolVariants,
                                 selectedTab == .search ? .fill : .none
                            )
                    }
                    .tag(Tab.search)
                
                UploadPostView(tabIndex: .constant(1))
                    .tabItem {
                        Label("", systemImage: "plus.square")
                            .environment(
                                \.symbolVariants,
                                 selectedTab == .upload ? .fill : .none
                            )
                    }
                    .tag(Tab.upload)
                
                NotificationsView()
                    .tabItem {
                        Label("", systemImage: "bell")
                            .environment(
                                \.symbolVariants,
                                 selectedTab == .notifications ? .fill : .none
                            )
                    }
                    .tag(Tab.notifications)
                
                ProfileView()
                    .tabItem {
                        Label("", systemImage: "person")
                            .environment(
                                \.symbolVariants,
                                 selectedTab == .profile ? .fill : .none
                            )
                    }
                    .tag(Tab.profile)
            }
            .tint(Color(uiColor: .label))
            .navigationTitle("Postgram")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    MainTabView()
}
