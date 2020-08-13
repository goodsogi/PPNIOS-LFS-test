//
//  MapManager.swift
//  PlusPedestrianNaviIOS
//
//  Created by Jeonggyu Park on 13/08/2020.
//  Copyright © 2020 박정규. All rights reserved.
//

class MapManager {
    //swift에서 singleton 사용하는 방법
    static let sharedInstance = MapManager()
    private init() {}

    public let NO_MAP = -1
     public let NAVER_MAP = 0
     public let GOOGLE_MAP = 1
     public let OFFLINE_MAP = 2
    
    public func initMapClientAndRenderer() {
        var activeMap: Int = UserDefaultManager.getCurrentMapOption()
        
        //한국에 있지 않은 경우
        if (!UserInfoManager.isUserInKorea()) {
            if (activeMap == NO_MAP) {
                activeMap = GOOGLE_MAP;
                UserDefaultManager.saveCurrentMapOption(mapOption: GOOGLE_MAP);
            }
        } else {
            if (activeMap == NO_MAP) {
                activeMap = NAVER_MAP;
                UserDefaultManager.saveCurrentMapOption(mapOption: NAVER_MAP);
            }
        }

        setActiveMapClientAndRenderer(mapOption: activeMap);
        
    }
    
    private func setActiveMapClientAndRenderer(mapOption: Int) {
        let naverMapClient: MapClient = NaverMapClient()
        
        
//        MapClient mapClient = null;
//
//        switch (mapOption) {
//            case NAVER_MAP:
//                mapClient = new NaverMapClient(context);
//                break;
//            case GOOGLE_MAP:
//                mapClient = new GoogleMapClient(context);
//                break;
//            case OFFLINE_MAP:
//                mapClient = new OfflineMapClient(context);
//                break;
//            default:
//                mapClient = new NaverMapClient(context);
//                break;
//        }
//
//        final MapClient finalMapClient = mapClient;
//        mapClient.createMap(new MapReadyListener() {
//
//            @Override
//            public void onMapReady() {
//                activeMapRenderer = finalMapClient.getRenderer();
//                ((MapReadyListener) context).onMapReady();
//            }
//
//            @Override
//            public void onMapNotAvailable() {
//                SharedPreferencesManager.saveCurrentMapOption(context.getApplicationContext(), MapManager.GOOGLE_MAP);
//                initMapClientAndRenderer();
//            }
//        });
//
//        activeMapClient = mapClient;
    }
}
