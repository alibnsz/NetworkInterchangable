//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by Mehmet Ali Bunsuz on 18.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init(){
        self.userListViewModel = UserListViewModel(service: Webservice())
    }
    
    var body: some View {
        NavigationView{
            List(userListViewModel.userList, id: \.id) { user in
                VStack{
                    Text(user.name)
                        .font(.title3)
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(user.username)
                        .font(.title3)
                        .foregroundStyle(.green)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(user.email)
                        .font(.title3)
                        .foregroundStyle(.brown)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(user.phone)
                        .font(.title3)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .navigationBarTitle("Users")
        .task {
            await userListViewModel.downloadUsers()
            
        }
        }
    }
}

#Preview {
    ContentView()
}
