//
//  ViewModel.swift
//  FIrstLessonTask2
//
//  Created by Xasan Xasanov on 07/06/23.
//

import Foundation
import SwiftUI

class GitHubViewModel: ObservableObject {
    @Published var user: GithubUser?
    
    init() {
        fetchGitHubUser()
    }
    
    func fetchGitHubUser() {
        // Replace "xvsvn" with the desired username
        let username = "xvsvn"
        
        guard let url = URL(string: "https://api.github.com/users/\(username)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(GithubUser.self, from: data)
                
                DispatchQueue.main.async {
                    self?.user = user
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}

