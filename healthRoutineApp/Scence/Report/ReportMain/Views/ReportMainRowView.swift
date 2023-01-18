//
//  ReportMainRowView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/05.
//

import SwiftUI

struct ReportMainRowView: View {

    @Binding var samples: [Int]
    let index : Int
    
    var part: String = ""
    var weight: String = ""
    var set: String = ""

    @State var offset = CGSize.zero
    @State var deleteButton: Bool = false

    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: -22) {
                HStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 54, height: 54)
                        .overlay {
                            Text("\(index)")
                                .font(Font.pretendard(.bold, size: 14))
                                .foregroundColor(.black)
                        }
                        .foregroundColor(.background_gray)
                        .cornerRadius(10)

                    VStack(alignment: .leading) {

                        Text("비하인드 숄더프레스")
                            .font(Font.pretendard(.semiBold, size: 14))
                            .foregroundColor(.white_text)

                        HStack {

                            Text("15kg")
                                .font(Font.pretendard(.semiBold, size: 14))
                                .foregroundColor(.white_text)

                            Text("X2")
                                .font(Font.pretendard(.semiBold, size: 14))
                                .foregroundColor(.white_text)
                        }
                    }

                    Spacer()
                }
                .padding(.horizontal, 12)
                .frame(width: geo.size.width,  height: geo.size.height, alignment: .leading)
                .background(Color.background_gray3)
                .cornerRadius(10)
                .zIndex(1)

                // 삭제버튼
                if deleteButton {
                    ZStack {
                        Image("trash")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .padding(.leading, 16)
                    .frame(width: 66, height: geo.size.height)
                    .background(Color.error_red)
                    .cornerRadius(10)
                    .onTapGesture {
                        if let idx = samples.firstIndex(where: { $0 == index }) {
                            samples.remove(at: idx)
                        }
                    }
                }
            }
            .frame(width: geo.size.width,  height: geo.size.height, alignment: .leading)
            .offset(self.offset)
            .animation(.spring(), value: self.offset.width)
            .gesture(DragGesture()
                .onChanged { gestrue in
                    self.offset.width = gestrue.translation.width
                    self.deleteButton = self.offset.width < 0 ? true : false
                }
                .onEnded { _ in
                    if self.offset.width <= -44 {
                        self.offset.width = -44
                        self.deleteButton = true
                    } else {
                        self.offset = .zero
                        self.deleteButton = false
                    }
                }
            )
        }
    }
}

struct ReportMainRowView_Previews: PreviewProvider {
    static var previews: some View {
        ReportMainRowView(samples: .constant([0,1,2,3]), index: 0)
    }
}
