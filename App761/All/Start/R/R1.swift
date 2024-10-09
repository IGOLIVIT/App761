//
//  R1.swift
//  App761
//
//  Created by IGOR on 07/10/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
            }
            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("All information in one application")
                        .foregroundColor(.black)
                        .font(.system(size: 32, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    HStack {
                        
                        HStack {
                            
                            Circle()
                                .fill(Color("prim"))
                                .frame(width: 10)
                            
                            Circle()
                                .fill(Color("prim").opacity(0.6))
                                .frame(width: 10)
                            
                        }
                        .frame(maxWidth: .infinity)
                        
                        NavigationLink(destination: {
                            
                            R2()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 150, height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                    .padding(.bottom)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 230)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    R1()
}
