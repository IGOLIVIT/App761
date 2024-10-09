//
//  LoadingView.swift
//  App761
//
//  Created by IGOR on 07/10/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("LLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 100)
            }
        }
    }
}

#Preview {
    LoadingView()
}
