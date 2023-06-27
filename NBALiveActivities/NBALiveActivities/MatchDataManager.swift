//
//  MatchDataManager.swift
//  NBALiveActivities
//
//  Created by JerryLiu on 2023/6/25.
//

import Foundation

class MatchDataManager {
    static let shared = MatchDataManager()
    
    //数据源 模拟
    var teams:[NBATeam] = [
        .init(teamName: "Lakers", teamId: "Lakers", teamLogo: "Los Angles Lakers logo", teamColor: "LakerHome", teamGuestColor: "LakerGuest", teamState: "12胜3负",likeNum: 101),
        .init(teamName: "Warriors", teamId: "Warriors", teamLogo: "golden-state-warriors", teamColor: "WarriorsHome",teamGuestColor: "WarriorsYellow", teamState: "14胜1负",likeNum: 666),
        .init(teamName: "Dallas", teamId: "Dallas", teamLogo: "Dallas Mavericks logo", teamColor: "Dallas Royal Blue", teamGuestColor: "Dallas Royal Blue", teamState: "9胜3负",likeNum: 321),
        .init(teamName:"Boston", teamId: "Boston", teamLogo: "Boston Celtics logo", teamColor: "Boston Celtics Green",teamGuestColor: "Boston Celtics Brown", teamState: "14胜0负",likeNum: 889)
    ]
    
    //模拟网络请求
    func requestAPI(urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "InvalidURL", code: -1, userInfo: nil)
        }
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        try await Task.sleep(nanoseconds: 2_000_000_000)//延迟两秒
        let (data, _) = try await session.data(for: request)
        
        return data
    }
}
