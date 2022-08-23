//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Alessandra Tjitro on 8/23/22.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            
            //scroll view pushes contents to the top
            VStack(spacing: 10) {
                Text("Time to shop!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Click the button below to add items to your grocery list")
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) :   Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0.0,
                        y: animate ? 40 : 20)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                
                
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        
        //make sure it's not called twice
        guard !animate else {return}
        //animation waits 1.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView().navigationTitle("Title")
        }
    }
}
