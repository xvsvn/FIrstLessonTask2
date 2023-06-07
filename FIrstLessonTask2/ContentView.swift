//
//  ContentView.swift
//  FIrstLessonTask2
//
//  Created by Xasan Xasanov on 07/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GitHubViewModel()
    
    var body: some View {
        VStack {
            if let user = viewModel.user {
                if let avatarURL = URL(string: user.avatar_url) {
                    AsyncImage(url: avatarURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(user.login)
                        .font(.title)
                        .bold()
                    
                    Text(String(user.id))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        VStack {
                            Text("\(user.followers)")
                                .font(.title)
                                .bold()
                            Text("Followers")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("\(user.following)")
                                .font(.title)
                                .bold()
                            Text("Following")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                } else {
                    ProgressView()
                }
            }
        }
    }
    
}
