//
//  ContentView.swift
//  flipAnimationTest
//
//  Created by DONG SHENG on 2022/9/13.
//


// 頁面翻轉
// 2個相同大小的View 疊再一起
// 使用同一個Bool 一個顯示反面一個顯示正面
// 利用rotation3DEffect 做出翻轉效果 一個角度為180 另一個就為相反數(-180)
// 通常 角度為 180倍數 -> 越多倍 翻越多圈
import SwiftUI

struct ContentView: View {
    
    @State private var flip: Bool = false
    
    var body: some View {
        Group{
            Button {
//                withAnimation{
                    flip.toggle()
//                }
            } label: {
                Rectangle()
                    .fill(.cyan)
                    .frame(width: 300, height: 300)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(flip ? 180 : 0), axis: (x: 0, y: 1, z: 0) )
                    .opacity(flip ? 1 : 0)
                    .overlay(
                        Rectangle()
                            .fill(.yellow)
                            .frame(width: 300, height: 300)
                            .cornerRadius(15)
                            .rotation3DEffect(.degrees(flip ? 0 : -180), axis: (x: 0, y: 1, z: 0) )
                            .opacity(flip ? 0 : 1)
                    )
                    
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
