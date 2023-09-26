//
//  ContentView.swift
//  NetworkRequest_Demo
//
//  Created by HubertMac on 24/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .onAppear{
            
            Task {
                await apiCall()
            }
        }
    }
    
    func apiCall() async {
        // 1. URL
        if let url = URL(string: "https://api.pexels.com/v1/search?query=nature&per_page=1") {
            
            
            // 2. URLRequest
           var request = URLRequest(url: url)
            request.addValue("PWUp6sAtMGRrY1HPn8r6nOw8qOCdsc136yAdSyL6Y5m1WEDSc2cCitjh", forHTTPHeaderField: "Authorization")
            
            
            // 3. URLSession
            do {
              let (data, response) = try await URLSession.shared.data(for: request)
                
                // Pharse the Json
                let decoder = JSONDecoder()
                
                
                do {
                  let searchResponse =  try decoder.decode(SearchResponse.self, from: data)
                    
                    for photo in searchResponse.photos {
                        print(photo)
                    }
                }
                catch {
                   print(error)
                }
                
                
                
            }
            catch {
                print(error)
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
