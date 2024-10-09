//
//  AddPart.swift
//  App761
//
//  Created by IGOR on 08/10/2024.
//

import SwiftUI

struct AddPart: View {
    
    @StateObject var viewModel: EventsViewModel
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
                        
                        viewModel.partNames.append(viewModel.pName)
                        
                        viewModel.pPhoto = viewModel.selPhoto
                        
                        viewModel.addParticipant()
                        
                        viewModel.pName = ""
                        viewModel.pAge = ""
                        viewModel.pDescr = ""
                        viewModel.selPhoto = ""
                        
                        viewModel.fetchParticipants()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddPart = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .padding(.horizontal, 4)
                            .padding(4)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .opacity(viewModel.pName.isEmpty || viewModel.pAge.isEmpty ? 0.6 : 1)
                    .disabled(viewModel.pName.isEmpty || viewModel.pAge.isEmpty ? true : false)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.photos, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selPhoto = index
                                    
                                }, label: {
                                     
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.selPhoto.isEmpty {
                                
                                Image(systemName: "camera.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 24, weight: .regular))
                                    .frame(width: 150, height: 150)
                                    .background(Circle().stroke(Color("prim")))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.selPhoto)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .padding(1)
                            }
                            
                        })
                        
                        Text("Name")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.pName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.pName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(1)
                        .padding(.bottom)
                        
                        Text("Age")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.pAge.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.pAge)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(1)
                        .padding(.bottom)
                        
                        Text("Description")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.pDescr.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.pDescr)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(1)
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    AddPart(viewModel: EventsViewModel())
}
