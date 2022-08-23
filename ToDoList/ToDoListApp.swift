//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Alessandra Tjitro on 8/19/22.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
