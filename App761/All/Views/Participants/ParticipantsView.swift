//
//  ParticipantsView.swift
//  App761
//
//  Created by IGOR on 07/10/2024.
//

import SwiftUI

struct ParticipantsView: View {

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
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddPart = true
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .padding(.horizontal, 4)
                            .padding(4)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                }

                Text("Participants")
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                if viewModel.participants.isEmpty {
                    
                    VStack {
                        
                        Image("empty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                        
                        Text("There are no records")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.participants, id: \.self) { index in
                            
                            HStack {
                                
                                Image(index.pPhoto ?? "")
                                    .resizable()
                                    .frame(width: 90, height: 90)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    Text(index.pName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .medium))
                                    
                                    Text(index.pAge ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Text(index.pDescr ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                }
                                .padding()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 170)
                            .background(RoundedRectangle(cornerRadius: 25).fill(.white).shadow(radius: 4))
                            .padding(4)
                        }
                    }
                }
            }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchParticipants()
        }
        .sheet(isPresented: $viewModel.isAddPart, content: {
            
            AddPart(viewModel: viewModel)
        })
    }
}

#Preview {
    ParticipantsView()
}
