//
//  NBALiveTrigger.swift
//  NBALiveActivities
//
//  Created by JerryLiu on 2022/10/12.
//

import Foundation
import ActivityKit

public class NBALiveTrigger {

    var statusActivity: Activity<NBAWidgetAttributes>?
    
    public func startLiveActivities() -> Void {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("当前设备不可用Live Activities，用户关闭或者设备无法使用")
            return
        }
        
        let guestTeam = NBATeam(teamName: "Lakers", teamId: "Lakers", teamLogo: "Los Angles Lakers logo", teamColor: "LakerHome", teamGuestColor: "LakerGuest", teamState: "12胜3负")
        let homeTeam = NBATeam(teamName: "Warriors", teamId: "WarriorsHome", teamLogo: "golden-state-warriors", teamColor: "WarriorsHome",teamGuestColor: "WarriorsYellow", teamState: "14胜1负")
        let attribute = NBAWidgetAttributes(home: homeTeam, guest: guestTeam)
        
        let date = Calendar.current.date(byAdding: .minute, value: (11), to: Date())!.timeIntervalSince1970
        
        let startState = NBAWidgetAttributes.ContentState(homeScore: 12, guestScore: 10, tips: "Q1", score: nil, time: date)
        
        do {
            self.statusActivity = try Activity<NBAWidgetAttributes>.request(attributes: attribute, contentState: startState, pushType: nil)
            print("开启Live Activities 成功 \(String(describing: self.statusActivity?.id))")
        } catch let e {
            print("开启Live Activities 失败，原因:\(e.localizedDescription)")
        }
    }
    
    public func startLiveActivitiesBVSD() -> Void {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("当前设备不可用Live Activities，用户关闭或者设备无法使用")
            return
        }
        
        let guestTeam = NBATeam(teamName: "Dallas", teamId: "Dallas", teamLogo: "Dallas Mavericks logo", teamColor: "Dallas Royal Blue", teamGuestColor: "Dallas Royal Blue", teamState: "9胜3负")
        let homeTeam = NBATeam(teamName: "Boston", teamId: "Boston", teamLogo: "Boston Celtics logo", teamColor: "Boston Celtics Green",teamGuestColor: "Boston Celtics Brown", teamState: "14胜0负")
        let attribute = NBAWidgetAttributes(home: homeTeam, guest: guestTeam)
        
        let date = Calendar.current.date(byAdding: .minute, value: (11), to: Date())!.timeIntervalSince1970
        
        let startState = NBAWidgetAttributes.ContentState(homeScore: 11, guestScore: 13, tips: "Q1", score: nil, time: date)
        
        do {
            self.statusActivity = try Activity<NBAWidgetAttributes>.request(attributes: attribute, contentState: startState, pushType: .token)
            print(self.statusActivity?.pushToken as Any)
            
            let pushTokenString = String(deviceToken: self.statusActivity?.pushToken ?? Data())
                    
            print("推送LiveActivities Token:\(String(describing: pushTokenString))")
            
            //开启监听
            let _ = self.listenForPushTokenChanged(activities: self.statusActivity)
        } catch let e {
            print("开启Live Activities 失败，原因:\(e.localizedDescription)")
        }
    }
    
    public func startPushLiveActivities() -> Void {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("当前设备不可用Live Activities，用户关闭或者设备无法使用")
            return
        }
        
        let guestTeam = NBATeam(teamName: "Lakers", teamId: "Lakers", teamLogo: "Los Angles Lakers logo", teamColor: "LakerHome", teamGuestColor: "LakerGuest", teamState: "12胜3负")
        let homeTeam = NBATeam(teamName: "Warriors", teamId: "WarriorsHome", teamLogo: "golden-state-warriors", teamColor: "WarriorsHome",teamGuestColor: "WarriorsYellow", teamState: "14胜1负")
        let attribute = NBAWidgetAttributes(home: homeTeam, guest: guestTeam)
        
        let date = Calendar.current.date(byAdding: .minute, value: (11), to: Date())!.timeIntervalSince1970
        
        let startState = NBAWidgetAttributes.ContentState(homeScore: 12, guestScore: 14, tips: "Q1", score: nil, time: date)
        
        do {
            self.statusActivity = try Activity<NBAWidgetAttributes>.request(attributes: attribute, contentState: startState, pushType: .token)
            
            print(self.statusActivity?.pushToken as Any)
            
            let pushTokenString = String(deviceToken: self.statusActivity?.pushToken ?? Data())
                    
            print("推送LiveActivities Token:\(String(describing: pushTokenString))")
            
            //开启监听
            let _ = self.listenForPushTokenChanged(activities: self.statusActivity)
            
        } catch let e {
            print("开启Live Activities 失败，原因:\(e.localizedDescription)")
        }
    }
    
    func listenForPushTokenChanged(activities:Activity<NBAWidgetAttributes>?) -> Task<Void, Error>? {
        guard let activities = activities else { return nil }
        
        return Task.detached {
            for await tokenData in activities.pushTokenUpdates {
                let pushTokenString = String(deviceToken: tokenData)
                print("\(activities.id)新Token:\(String(describing: pushTokenString))")
                
                //发送这个ID和Token给后台服务器
            }
        }
    }
    
    public func updateCurrentLiveActivities3() -> Void {
        Task {
            
            let date = Calendar.current.date(byAdding: .minute, value: (12), to: Date())!.timeIntervalSince1970
            
            let updateState = NBAWidgetAttributes.ContentState(homeScore: 122, guestScore: 20, tips: "Q1", score: nil, time: date)
            
            await self.statusActivity?.update(using: updateState)
        }
    }
    
    public func endLiveActivities() -> Void {
        Task {
            let date = Calendar.current.date(byAdding: .minute, value: (12), to: Date())!.timeIntervalSince1970
            
            let endState = NBAWidgetAttributes.ContentState(homeScore: 94, guestScore: 102, tips: "Finished", score: nil, time: date)
            
            await self.statusActivity?.end(using: endState,dismissalPolicy: .default)//+4h
//            await self.statusActivity?.end(using: endState,dismissalPolicy: .immediate)//立刻结束
//            await self.statusActivity?.end(using: endState,dismissalPolicy: .after(Date().addingTimeInterval(60 * 60)))//一小时之后结束
        }
    }
    
}
