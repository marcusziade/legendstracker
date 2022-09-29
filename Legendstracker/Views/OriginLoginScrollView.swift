//
//  OriginLoginScrollView.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import SwiftUI

struct OriginLoginScrollView: View {
    
    let status: ServerStatus
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Origin login")
                .font(.title)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 32) {
                    ServerStatusRegionView(
                        title: "EU West",
                        status: status.originLogin.euWest.status,
                        httpCode: status.originLogin.euWest.httpCode,
                        responseTime: status.originLogin.euWest.responseTime,
                        queryTimestamp: status.originLogin.euWest.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "EU East",
                        status: status.originLogin.euEast.status,
                        httpCode: status.originLogin.euEast.httpCode,
                        responseTime: status.originLogin.euEast.responseTime,
                        queryTimestamp: status.originLogin.euEast.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "US West",
                        status: status.originLogin.usWest.status,
                        httpCode: status.originLogin.usWest.httpCode,
                        responseTime: status.originLogin.usWest.responseTime,
                        queryTimestamp: status.originLogin.usWest.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "US Central",
                        status: status.originLogin.usCentral.status,
                        httpCode: status.originLogin.usCentral.httpCode,
                        responseTime: status.originLogin.usCentral.responseTime,
                        queryTimestamp: status.originLogin.usCentral.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "US East",
                        status: status.originLogin.usEast.status,
                        httpCode: status.originLogin.usEast.httpCode,
                        responseTime: status.originLogin.usEast.responseTime,
                        queryTimestamp: status.originLogin.usEast.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "South America",
                        status: status.originLogin.southAmerica.status,
                        httpCode: status.originLogin.southAmerica.httpCode,
                        responseTime: status.originLogin.southAmerica.responseTime,
                        queryTimestamp: status.originLogin.southAmerica.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "Asia",
                        status: status.originLogin.asia.status,
                        httpCode: status.originLogin.asia.httpCode,
                        responseTime: status.originLogin.asia.responseTime,
                        queryTimestamp: status.originLogin.asia.queryTimestamp
                    )
                }
            }
        }
    }
}

struct OriginLoginScrollView_Previews: PreviewProvider {
    
    static var previews: some View {
        OriginLoginScrollView(status: ApexService().serverStatusMock)
    }
}
