//
//  SettingsView.swift
//  App761
//
//  Created by IGOR on 07/10/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {

    @StateObject var viewModel = EventsViewModel()
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        back.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                        }
                    })
                    
                    Spacer()

                }

                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 18) {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            Text("Rate Us")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 22)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/6e36cf18-14f6-4990-8846-630b8d06b075") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 22)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
