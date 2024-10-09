//
//  EventsView.swift
//  App761
//
//  Created by IGOR on 07/10/2024.
//

import SwiftUI

struct EventsView: View {
    
    @StateObject var viewModel = EventsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("prim2")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddEvent = true
                    }
                    
                }, label: {
                    
                    Text("+ Add an event")
                        .foregroundColor(.white)
                        .font(.system(size: 13, weight: .medium))
                        .padding(4)
                        .padding(.horizontal, 4)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("Events")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    Text("\(Text("\(viewModel.records)").foregroundColor(Color("prim2")).font(.system(size: 18, weight: .medium))) records")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isSettings = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 18, weight: .regular))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    })
                }
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isParticipants = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Participants")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                })
                
                if viewModel.events.isEmpty {
                    
                    VStack {
                        
                        Image("empty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                        
                        Text("There are no records")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                        
                    }
                    .padding()
                    .frame(maxHeight: .infinity)
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.events, id: \.self) { index in
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text(index.evName ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text(index.evLoc ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
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
                                    
                                    VStack(alignment: .leading) {
                                        
                                        HStack {
                                            
                                            Image(index.evPhoto ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100)
                                            
                                            VStack(alignment: .leading, spacing: 7) {
                                                
                                                Text("Date")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text(index.evDate ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 16, weight: .medium))
                                                
                                                Text("Time")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text(index.evTime ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 16, weight: .medium))
                                            }
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            
                                            Text("Visitors")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Text(index.evType ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .medium))
                                                .padding(4)
                                                .padding(.horizontal, 4)
                                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                        }
                                        
                                        Text(index.evVis ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 30, weight: .semibold))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        HStack {
                                            
                                            Image("g1")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 45)
                                            
                                            Image("g3")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 45)
                                                .position(y: 20)
                                            
                                        }
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(radius: 4))
                                    .padding(4)
                                    
                                } else if viewModel.selCase == "Participants" {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Image(index.evPart ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 35)
                                            
                                            Text(index.evPart ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Spacer()
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(radius: 4))
                                    .padding(4)
                                    
                                } else if viewModel.selCase == "Statistics" {
                                    
                                    VStack(alignment: .leading, spacing: 7) {
                                        
                                        Text("Budget")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text(index.evBudget ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 30, weight: .semibold))
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 6) {
                                                
                                                Text(index.evPlaces ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 17, weight: .regular))
                                                
                                                Text("Places")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14, weight: .regular))
                                            }
                                            .frame(maxWidth: .infinity)
                                            
                                            VStack(alignment: .leading, spacing: 6) {
                                                
                                                Text(index.evSponsors ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 17, weight: .regular))
                                                
                                                Text("Sponsors")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14, weight: .regular))
                                            }
                                            .frame(maxWidth: .infinity)
                                            
                                            VStack(alignment: .leading, spacing: 6) {
                                                
                                                Text(index.evTickets ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 17, weight: .regular))
                                                
                                                Text("Tickets")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14, weight: .regular))
                                            }
                                            .frame(maxWidth: .infinity)
                                        }
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(radius: 4))
                                    .padding(4)
                                }
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                        }
                    }
                }
            }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchEvents()
        }
        .sheet(isPresented: $viewModel.isAddEvent, content: {
            
            AddEvent(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isParticipants, content: {
            
            ParticipantsView()
        })
        .sheet(isPresented: $viewModel.isSettings, content: {
            
            SettingsView()
        })
    }
}

#Preview {
    EventsView()
}
