//
//  ContentView.swift
//  NBALiveActivities
//
//  Created by JerryLiu on 2022/10/12.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    let gameTrigger: NBALiveTrigger = NBALiveTrigger()
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8.0) {
                HStack {
                    Image("nbalogo2")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60.0, height: 26.0)
                        .cornerRadius(10)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .strokeStyle(cornerRadius: 16)
                    
                    Image("Los Angles Lakers logo")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60.0, height: 60.0)
                        .cornerRadius(10)
                        .padding(9)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .strokeStyle(cornerRadius: 16)
                    
                    Image("golden-state-warriors")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60.0, height: 60.0)
                        .cornerRadius(10)
                        .padding(9)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .strokeStyle(cornerRadius: 16)
                }
                Text("湖人 VS 勇士")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.linearGradient(colors: [Color("LakerGuest"), Color("LakerGuest").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .lineLimit(1)
                Text("2022年10月22日 上午11:00".uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                Text("")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.secondary)
                
                if ActivityAuthorizationInfo().areActivitiesEnabled {
                    Button {
                        DispatchQueue
                            .main
                            .asyncAfter(deadline: .now() + 0,
                                        execute: {
                                gameTrigger.startPushLiveActivities()
                            })
                        
                    } label: {
                        Text("开启锁屏Live")
                            .font(.system(size: 18, weight: .medium))
                    }
                }
                
            }
            .padding(.all, 20.0)
            .padding(.vertical, 20)
            .frame(height: 300.0)
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
            .strokeStyle()
            .padding(.horizontal, 20)
            .background(
                Image("Background1")
            )
            
            VStack(alignment: .leading, spacing: 8.0) {
                HStack {
                    Image("nbalogo2")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60.0, height: 26.0)
                        .cornerRadius(10)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .strokeStyle(cornerRadius: 16)
                    
                    Image("Dallas Mavericks logo")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60.0, height: 60.0)
                        .cornerRadius(10)
                        .padding(9)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .strokeStyle(cornerRadius: 16)
                    
                    Image("Boston Celtics logo")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60.0, height: 60.0)
                        .cornerRadius(10)
                        .padding(9)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .strokeStyle(cornerRadius: 16)
                }
                Text("小牛 VS 凯尔特人")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.linearGradient(colors: [Color("Boston Celtics Green"), Color("Boston Celtics Green").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .lineLimit(1)
                Text("2022年10月22日 上午12:00".uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                Text("")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.secondary)
                if ActivityAuthorizationInfo().areActivitiesEnabled {
                    Button {
                        DispatchQueue
                            .main
                            .asyncAfter(deadline: .now() + 0,
                                        execute: {
                                gameTrigger.startLiveActivitiesBVSD()
                            })
                        
                    } label: {
                        Text("开启锁屏Live")
                            .font(.system(size: 18, weight: .medium))
                    }
                    
                }
                
            }
            .padding(.all, 20.0)
            .padding(.vertical, 20)
            .frame(height: 300.0)
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
            .strokeStyle()
            .padding(.horizontal, 20)
            .background(
                Image("Background2")
            )
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
