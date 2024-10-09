//
//  AddEvent.swift
//  App761
//
//  Created by IGOR on 08/10/2024.
//

import SwiftUI

struct AddEvent: View {

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
                        
                        viewModel.records += 1
                        
                        viewModel.evPart = viewModel.selParName
                        
                        viewModel.evPhoto = viewModel.selEventPhoto
                        
                        viewModel.addEvent()
                        
                        viewModel.evName = ""
                        viewModel.evLoc = ""
                        viewModel.evDate = ""
                        viewModel.evTime = ""
                        viewModel.evVis = ""
                        viewModel.evType = ""
                        viewModel.evPart = ""
                        viewModel.evBudget = ""
                        viewModel.evTickets = ""
                        viewModel.evPlaces = ""
                        viewModel.evSponsors = ""
                        viewModel.selEventPhoto = ""
                        viewModel.selParName = ""
                        
                        viewModel.fetchEvents()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddEvent = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .padding(.horizontal, 4)
                            .padding(4)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .opacity(viewModel.evName.isEmpty || viewModel.evLoc.isEmpty || viewModel.evDate.isEmpty || viewModel.evTime.isEmpty || viewModel.evVis.isEmpty || viewModel.evType.isEmpty || viewModel.evBudget.isEmpty || viewModel.evBudget.isEmpty || viewModel.evTickets.isEmpty || viewModel.evPlaces.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.evName.isEmpty || viewModel.evLoc.isEmpty || viewModel.evDate.isEmpty || viewModel.evTime.isEmpty || viewModel.evVis.isEmpty || viewModel.evType.isEmpty || viewModel.evBudget.isEmpty || viewModel.evBudget.isEmpty || viewModel.evTickets.isEmpty || viewModel.evPlaces.isEmpty ? true : false)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.eventPhoto, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selEventPhoto = index
                                    
                                }, label: {
                                     
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.selEventPhoto.isEmpty {
                                
                                Image(systemName: "camera.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 24, weight: .regular))
                                    .frame(width: 150, height: 150)
                                    .background(Circle().stroke(Color("prim")))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.selEventPhoto)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .padding(1)
                            }
                            
                        })
                        .padding(.bottom, 8)
                        
                        HStack {
                            
                            ForEach(viewModel.cases, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selCase = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 13, weight: viewModel.selCase == index ? .medium : .regular))
                                        .padding(4)
                                        .frame(maxWidth: .infinity)
                                        .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(viewModel.selCase == index ? 1 : 0)))
                                })
                            }
                        }
                        .padding(3)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.bottom)
                        
                        if viewModel.selCase == "Information" {
                            
                            Text("Name")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.evName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.evName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                            .padding(1)
                            .padding(.bottom)
                            
                            Text("Location")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.evLoc.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.evLoc)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                            .padding(1)
                            .padding(.bottom)
                            
                            HStack {
                                
                                VStack(alignment:. leading) {
                                    
                                    Text("Date")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.evDate.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.evDate)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                                    .padding(1)
                                }
                                
                                VStack(alignment:. leading) {
                                    
                                    Text("Time")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.evTime.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.evTime)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                                    .padding(1)
                                }
                            }
                            
                            HStack {
                                
                                VStack(alignment:. leading) {
                                    
                                    Text("Visitors")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.evVis.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.evVis)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                                    .padding(1)
                                }
                                
                                VStack(alignment:. leading) {
                                    
                                    Text("Type of race")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.evType.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.evType)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                                    .padding(1)
                                }
                            }
                            
                        } else if viewModel.selCase == "Participants" {
                            
                            VStack {
                                
                                ForEach(viewModel.partNames, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.selParName = index
                                        
                                    }, label: {
                                        
                                        HStack {

                                            Text(index)
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Spacer()
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim2").opacity(viewModel.selParName == index ? 1 : 0)))
                                        .padding(1)
                                    })
                                }
                            }
                            
                        } else if viewModel.selCase == "Statistics" {
                            
                            Text("Budget")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.evBudget.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.evBudget)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                            .padding(1)
                            .padding(.bottom)
                            
                            HStack {
                                
                                VStack(alignment:. leading) {
                                    
                                    Text("Tickets")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.evTickets.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.evTickets)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                                    .padding(1)
                                }
                                
                                VStack(alignment:. leading) {
                                    
                                    Text("Places")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.evPlaces.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.evPlaces)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                                    .padding(1)
                                }
                                
                                VStack(alignment:. leading) {
                                    
                                    Text("Sponsors")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Enter")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.evSponsors.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.evSponsors)
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
                        
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    AddEvent(viewModel: EventsViewModel())
}
