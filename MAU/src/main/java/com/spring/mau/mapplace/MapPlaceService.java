package com.spring.mau.mapplace;

public interface MapPlaceService {
	void insertMapPlace(MapPlaceVO vo);
	void deleteMapPlace(MapPlaceVO vo);
	MapPlaceVO getMapPlaceSeq(MapPlaceVO vo);
}
