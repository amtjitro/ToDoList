//
//  ItemModel.swift
//  ToDoList
//
//  Created by Alessandra Tjitro on 8/22/22.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
