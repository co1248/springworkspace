package com.spring.mau.mapview;

import java.util.List;

public interface MapViewService {
	List<MapViewVO> getMap(MapViewVO vo);
	List<MapViewVO> getMapSeq(MapViewVO vo);
}
