//
//  ReportMainRowView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/05.
//

import SwiftUI

struct ReportMainRowView_Backup: View {
    
    var part: String = ""
    var weight: String = ""
    var set: String = ""
    
    var body: some View {

        HStack {
            
            Rectangle()
                .frame(width: 50, height: 50)
                .overlay {
                    Text("가슴")
                        .font(Font.pretendard(.bold, size: 18))
                        .foregroundColor(.black)
                }
                .foregroundColor(Color(hex:"C5C5C5"))
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                
                Text("비하인드 숄더프레스")
                    .font(Font.pretendard(.bold, size: 18))
                    .foregroundColor(.white)
                
                HStack {
                    
                    Text("15kg")
                        .font(Font.pretendard(.bold, size: 18))
                        .foregroundColor(.white)
                    
                    Text("X2")
                        .font(Font.pretendard(.bold, size: 18))
                        .foregroundColor(.white)
                }
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 74)
        .padding(.horizontal, 12)
        .background(Color.background_gray3)
        .cornerRadius(16)
    }
}

struct ReportMainRowView_Backup_Previews: PreviewProvider {
    static var previews: some View {
        ReportMainRowView_Backup()
    }
}
