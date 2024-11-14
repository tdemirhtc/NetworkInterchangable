//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by Hatice Taşdemir on 9.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    init() {
        self.userListViewModel = UserListViewModel(service:  LocalService())
    }
    
    var body: some View {
        List(userListViewModel.userList,id: \.id) {
            user in
            VStack{
                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.purple)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Text(user.username)
                    .foregroundColor(.yellow)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Text(user.email)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}

#Preview {
    ContentView()
}
