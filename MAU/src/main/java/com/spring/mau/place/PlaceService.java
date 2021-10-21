package com.spring.mau.place;

public interface PlaceService {
	void insertPlace(PlaceVO vo);
	
	PlaceVO getPlace(PlaceVO vo);
	
	PlaceVO getPlaceSeq(PlaceVO vo);
}
