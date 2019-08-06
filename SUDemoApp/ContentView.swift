//
//  ContentView.swift
//  SUDemoApp
//
//  Created by Amit Singh on 06/08/19.
//  Copyright © 2019 Amit Singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    struct Employee: Identifiable {
               let id: Int
               let name: String
               let postion: String
       }
    var employeeList = [
      Employee(id: 1, name: "sam", postion: "Sr. iOS Developer"),
      Employee(id: 2, name: "sid", postion: "Sr. iOS Developer"),
      Employee(id: 3, name: "bing", postion: "iOS Developer"),
      Employee(id: 4, name: "den", postion: "Sr. QA"),
      Employee(id: 5, name: "eric", postion: "Sr. Android Developer"),
      Employee(id: 6, name: "fizz", postion: "Manager"),
    ]
    var body: some View {
        NavigationView {
            List(employeeList) { employee in
                
                NavigationLink(destination: ProfileDetailView(headerText: employee.name, positionText: employee.postion, profileImageName: "1055000-256")) {
                    
                    ProfileImage(imageName: "1055000-256")
                    HeaderLabel(title: "\(employee.name)")
                    HeaderLabel(title: "\(employee.postion)")
                    
                }
            }.navigationBarTitle(Text("Profiles"))
        }
            
    }
    
    
    struct ProfileDetailView: View {
        let headerText: String
        let positionText: String
        let profileImageName: String

        var body: some View {
            VStack {
                ProfileImageWithShadow(imageName: profileImageName)
                HeaderLabel(title: headerText)
                    .font(.largeTitle)
                HeaderLabel(title: positionText)
                .font(.largeTitle)
            }
        }
    }
    
    struct HeaderLabel : View {
        
        let title: String
        var body: some View {
            return Text(title).font(.callout).multilineTextAlignment(.leading).padding(20)
            
        }
    }
    
    struct SubmitButton: View {
        let title: String
        var body: some View {
            return Button(
            action: {
                // call your action here
                self.abc()
              },
            label: {
              Text(title).foregroundColor(.black).font(.caption)
            })
                .padding(10)
                .background(Color.green)
                .cornerRadius(5.0)
        }
        
        func abc(){
            
        }
    }
    
    struct ProfileImageWithShadow: View {
        let imageName: String
        var body: some View {
            return Image(imageName)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
    struct ProfileImage: View {
           let imageName: String
           var body: some View {
            return Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: 30, minHeight: 0, maxHeight: 30)
           }
       }
    
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
