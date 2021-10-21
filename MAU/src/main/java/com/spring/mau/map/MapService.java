package com.spring.mau.map;

import java.util.List;

public interface MapService {
	void insertMap(MapVO vo);
	void insertGuideMap(MapVO vo);
	List<MapVO> getMapList(MapVO vo);
	List<MapVO> getguideMapList(MapVO vo);
	List<MapVO> getguiderMapList(MapVO vo);
}
