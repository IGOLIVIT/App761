//
//  ContentView.swift
//  App761
//
//  Created by IGOR on 07/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
            EventsView()
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
