//
//  AddView.swift
//  ToDoList
//
//  Created by Alessandra Tjitro on 8/22/22.
//

import SwiftUI

struct AddView: View {
    
    //allows us to move back through views
    @Environment(\.presentationMode) var presentationMode
    
    //gives access to items array
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here:", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 1.0, saturation: 0.022, brightness: 0.911))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✍️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            
            //tells presentation mode to go back one view
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    // ensures that the text is reasonable
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "🚨 New item must be at least 3 characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
                .environmentObject(ListViewModel())
        }
        
    }
}
