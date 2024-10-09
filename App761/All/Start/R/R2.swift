//
//  R2.swift
//  App761
//
//  Created by IGOR on 07/10/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
            }
            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Create and edit whenever you want")
                        .foregroundColor(.black)
                        .font(.system(size: 32, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    HStack {
                        
                        HStack {
                            
                            Circle()
                                .fill(Color("prim").opacity(0.6))
                                .frame(width: 10)
                            
                            Circle()
                                .fill(Color("prim"))
                                .frame(width: 10)

                        }
                        .frame(maxWidth: .infinity)
                        
                        Button(action: {
                            
                           status = true
                            
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
    R2()
}
