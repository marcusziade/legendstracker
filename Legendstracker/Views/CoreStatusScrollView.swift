//
//  CoreStatusScrollView.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import SwiftUI

struct CoreStatusScrollView: View {
    
    let status: ServerStatus
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Core")
                .font(.title2)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 32) {
                    ServerStatusRegionView(
                        title: "Status website",
                        status: status.selfCoreTest.statusWebsite.status,
                        httpCode: status.selfCoreTest.statusWebsite.httpCode,
                        responseTime: status.selfCoreTest.statusWebsite.responseTime,
                        queryTimestamp: status.selfCoreTest.statusWebsite.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "Stats API",
                        status: status.selfCoreTest.statsAPI.status,
                        httpCode: status.selfCoreTest.statsAPI.httpCode,
                        responseTime: status.selfCoreTest.statsAPI.responseTime,
                        queryTimestamp: status.selfCoreTest.statsAPI.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "Overflow 1",
                        status: status.selfCoreTest.overflow1.status,
                        httpCode: status.selfCoreTest.overflow1.httpCode,
                        responseTime: status.selfCoreTest.overflow1.responseTime,
                        queryTimestamp: status.selfCoreTest.overflow1.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "Overflow 2",
                        status: status.selfCoreTest.overflow2.status,
                        httpCode: status.selfCoreTest.overflow2.httpCode,
                        responseTime: status.selfCoreTest.overflow2.responseTime,
                        queryTimestamp: status.selfCoreTest.overflow2.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "Origin API",
                        status: status.selfCoreTest.originAPI.status,
                        httpCode: status.selfCoreTest.originAPI.httpCode,
                        responseTime: status.selfCoreTest.originAPI.responseTime,
                        queryTimestamp: status.selfCoreTest.originAPI.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "Playstation API",
                        status: status.selfCoreTest.playstationAPI.status,
                        httpCode: status.selfCoreTest.playstationAPI.httpCode,
                        responseTime: status.selfCoreTest.playstationAPI.responseTime,
                        queryTimestamp: status.selfCoreTest.playstationAPI.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "Xbox API",
                        status: status.selfCoreTest.xboxAPI.status,
                        httpCode: status.selfCoreTest.xboxAPI.httpCode,
                        responseTime: status.selfCoreTest.xboxAPI.responseTime,
                        queryTimestamp: status.selfCoreTest.xboxAPI.queryTimestamp
                    )
                }
            }
        }
    }
}

struct CoreStatusScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CoreStatusScrollView(status: ApexService().serverStatusMock)
    }
}
