package com.spring.mau.mapview;

import java.util.List;

public interface MapViewService {
	List<MapViewVO> getMap(MapViewVO vo);
	List<MapViewVO> getGuiderPlace(MapViewVO vo);
	List<MapViewVO> getMapSeq(MapViewVO vo);
	List<MapViewVO> getRandomMap(MapViewVO vo);
	MapViewVO getBySeq(MapViewVO vo);
	MapViewVO getPlaceCnt(MapViewVO vo);
}
