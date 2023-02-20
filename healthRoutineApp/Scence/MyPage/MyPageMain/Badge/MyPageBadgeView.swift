//
//  MyPageBadgeView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageBadgeView: View {
    
    @ObservedObject var viewModel = BadgeViewModel()
    
    @State var isPresented: Bool = false
    
    init(viewModel: BadgeViewModel = BadgeViewModel()) {
        self.viewModel = viewModel
        
        self.viewModel.fetchInfos()
    }
    
    private let rows = [
        GridItem(.flexible(minimum: 80, maximum: 80)),
        GridItem(.flexible(minimum: 80, maximum: 80)),
        GridItem(.flexible(minimum: 80, maximum: 80))
    ]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 7) {
            
            HStack(spacing: 3) {
                
                Image("questionMark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("나의 배지")
                        .font(Font.pretendard(.bold, size: 20))
                        .foregroundColor(.white)
                        .frame(height: 31)
                    
                    Text("운동을 하여 배지를 획득해 보세요!")
                        .font(Font.pretendard(.semiBold, size: 14))
                        .foregroundColor(.white)
                        .frame(height: 31)
                }
            }
            
            LazyHGrid(rows: rows, spacing: 0) {
                
                ForEach(self.viewModel.totalBadge.indices, id: \.self) { index in
                    
                    Button {
                        
                        self.viewModel.showDetailView(index)
                        
                    } label: {
                        
                        Image(uiImage: self.viewModel.totalBadge[index]!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }
                    
                }
            }
            .halfSheet(showSheet: self.$isPresented) {
                
                ZStack {
                    Color.box_color
                    MyPageBadgeDetailView(viewModel: self.viewModel)
                }
                .ignoresSafeArea()
               
            } onEnd: {  }
        }
        .padding(.horizontal, 15)
        .frame(height: 395)
        .background(Color.box_color)
        .cornerRadius(10)
        .onAppear {
            
            self.viewModel.isPreseted
                .receive(on: RunLoop.main)
                .sink(receiveValue: { self.isPresented = $0 })
                .store(in: &self.viewModel.cancellables)
        }
    }
}

struct MyPageBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageBadgeView()
    }
}
