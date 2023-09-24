//
//  AsyncDemoView.swift
//  NetworkRequest_Demo
//
//  Created by HubertMac on 18/09/2023.
//

import SwiftUI

struct AsyncDemoView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("\(Thread.current): Start onAppear Work")
            
            // the call needs to be in a Task blok (or .task block modifier)
            Task {
                
                // the call needs to have await key word in the front of it
                await fetchData()
                print("\(Thread.current): After long task")
                
                // if is needed to run some code for updating UI inside of Task block use  await MainActor.run block code
                await MainActor.run {
                    print("Displaying some data on the screen")
                }
                
            }
           print("\(Thread.current): Other onAppearWork")
        }
    }
     
    
    // asynchronous code with an async keyword
    func fetchData() async {
        print("\(Thread.current): Long task")
    }
    
}

struct AsyncDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncDemoView()
    }
}
