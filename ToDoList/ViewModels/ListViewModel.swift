//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Alessandra Tjitro on 8/22/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            //if anything changed this array...save items
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    //initializer which will call get items
    init() {
        getItems()
    }
    
    //get items appends items to items array
    func getItems() {
        
        // will try to get data from key safely and convert backc to itemmodel
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedItems
        
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        //starts off as false because we are only adding it to the list
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        
        //will find the index of which the item in our existing array matches what we are looking for
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
