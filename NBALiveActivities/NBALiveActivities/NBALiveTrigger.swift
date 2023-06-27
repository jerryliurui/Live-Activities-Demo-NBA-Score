//
//  NBALiveTrigger.swift
//  NBALiveActivities
//
//  Created by JerryLiu on 2022/10/12.
//

import Foundation
import ActivityKit

public class NBALiveTrigger {
    static let shared = NBALiveTrigger()
    
    var statusActivity: Activity<NBAWidgetAttributes>?
    
    public func startLiveActivities() -> Void {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("当前设备不可用Live Activities，用户关闭或者设备无法使用")
            return
        }
        
        let guestTeam = MatchDataManager.shared.teams.filter { $0.teamId == "Lakers" }.first!
        let homeTeam = MatchDataManager.shared.teams.filter { $0.teamId == "Warriors" }.first!
        let attribute = NBAWidgetAttributes(home: homeTeam, guest: guestTeam)
        
        let date = Calendar.current.date(byAdding: .minute, value: (11), to: Date())!.timeIntervalSince1970
        
        let startState = NBAWidgetAttributes.ContentState(homeScore: 12, guestScore: 10,homeLike: homeTeam.likeNum,guestLike: guestTeam.likeNum, tips: "Q1", score: nil, time: date)
        
        do {
            self.statusActivity = try Activity<NBAWidgetAttributes>.request(attributes: attribute, contentState: startState, pushType: nil)
            print("开启Live Activities 成功 \(String(describing: self.statusActivity?.id))")
        } catch let e {
            print("开启Live Activities 失败，原因:\(e.localizedDescription)")
        }
    }
    
    public func updateLiveActivitiesLAVSWA() -> Void {
        let guestTeam = MatchDataManager.shared.teams.filter { $0.teamId == "Lakers" }.first!
        let homeTeam = MatchDataManager.shared.teams.filter { $0.teamId == "Warriors" }.first!
        
        
        let date = Calendar.current.date(byAdding: .minute, value: (11), to: Date())!.timeIntervalSince1970
        
        let updateState = NBAWidgetAttributes.ContentState(homeScore: 22, guestScore: 10, homeLike: homeTeam.likeNum, guestLike: guestTeam.likeNum, tips: "Q1", score: nil, time: date)
        Task {
            await self.statusActivity?.update(using: updateState)
        }
    }
    
    public func startLiveActivitiesBVSD() -> Void {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("当前设备不可用Live Activities，用户关闭或者设备无法使用")
            return
        }
        
        let guestTeam = MatchDataManager.shared.teams.filter { $0.teamId == "Dallas" }.first!
        let homeTeam = MatchDataManager.shared.teams.filter { $0.teamId == "Boston" }.first!
        let attribute = NBAWidgetAttributes(home: homeTeam, guest: guestTeam)
        
        let date = Calendar.current.date(byAdding: .minute, value: (11), to: Date())!.timeIntervalSince1970
        
        let startState = NBAWidgetAttributes.ContentState(homeScore: 11, guestScore: 13, homeLike: homeTeam.likeNum,guestLike: guestTeam.likeNum, tips: "Q1", score: nil, time: date)
        
        do {
            self.statusActivity = try Activity<NBAWidgetAttributes>.request(attributes: attribute, contentState: startState, pushType: .token)
            print(self.statusActivity?.pushToken as Any)
            
            let pushTokenString = String(deviceToken: self.statusActivity?.pushToken ?? Data())
                    
            print("推送LiveActivities Token:\(String(describing: pushTokenString))")
            
            UploadManager().uploadToken(tokenString: pushTokenString)
            
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
        
        let guestTeam = MatchDataManager.shared.teams.filter { $0.teamId == "Lakers" }.first!
        let homeTeam = MatchDataManager.shared.teams.filter { $0.teamId == "Warriors" }.first!
        let attribute = NBAWidgetAttributes(home: homeTeam, guest: guestTeam)
        
        let date = Calendar.current.date(byAdding: .minute, value: (11), to: Date())!.timeIntervalSince1970
        
        let startState = NBAWidgetAttributes.ContentState(homeScore: 12, guestScore: 14, homeLike: homeTeam.likeNum,guestLike: guestTeam.likeNum, tips: "Q1", score: nil, time: date)
        
        do {
            self.statusActivity = try Activity<NBAWidgetAttributes>.request(attributes: attribute, contentState: startState, pushType: .token)
            self.statusActivity?.activityState
            print(self.statusActivity?.pushToken as Any)
            
            let pushTokenString = String(deviceToken: self.statusActivity?.pushToken ?? Data())
                    
            print("推送LiveActivities Token:\(String(describing: pushTokenString))")
            
            UploadManager().uploadToken(tokenString: pushTokenString)
            
            //开启监听
            let _ = self.listenForPushTokenChanged(activities: self.statusActivity)
            
        } catch let e {
            print("开启Live Activities 失败，原因:\(e.localizedDescription)")
        }
    }
    
    func listenForPushTokenChanged(activities:Activity<NBAWidgetAttributes>?) -> Task<Void, Error>? {
        guard let activities = activities else { return nil }
        
        return Task {
            for await tokenData in activities.pushTokenUpdates {
                let pushTokenString = String(deviceToken: tokenData)
                print("\(activities.id)新Token:\(String(describing: pushTokenString))")
                
                //发送这个ID和Token给后台服务器
                UploadManager().uploadToken(tokenString: pushTokenString)
            }
        }
    }
    
    public func updateCurrentLiveActivities3() -> Void {
        Task {
            
            let date = Calendar.current.date(byAdding: .minute, value: (12), to: Date())!.timeIntervalSince1970
            
            let updateState = NBAWidgetAttributes.ContentState(homeScore: 122, guestScore: 20, homeLike: 100 ,guestLike: 200, tips: "Q1", score: nil, time: date)
            
            await self.statusActivity?.update(using: updateState)
        }
    }
    
    public func endLiveActivities() -> Void {
        Task {
            let date = Calendar.current.date(byAdding: .minute, value: (12), to: Date())!.timeIntervalSince1970
            
            let endState = NBAWidgetAttributes.ContentState(homeScore: 94, guestScore: 102, homeLike: 100 ,guestLike: 200 ,tips: "Finished", score: nil, time: date)
            
            await self.statusActivity?.end(using: endState,dismissalPolicy: .default)//+4h
//            await self.statusActivity?.end(using: endState,dismissalPolicy: .immediate)//立刻结束
//            await self.statusActivity?.end(using: endState,dismissalPolicy: .after(Date().addingTimeInterval(60 * 60)))//一小时之后结束
        }
    }
    
}
