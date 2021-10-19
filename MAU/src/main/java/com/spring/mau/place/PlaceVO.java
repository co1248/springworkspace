package com.spring.mau.place;

public class PlaceVO {
	private int placeSeq, placeId;
	private String placeSouthWest, placeNorthEast, placeName, placeAddr;
	public int getPlaceSeq() {
		return placeSeq;
	}
	public void setPlaceSeq(int placeSeq) {
		this.placeSeq = placeSeq;
	}
	public int getPlaceId() {
		return placeId;
	}
	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}
	public String getPlaceSouthWest() {
		return placeSouthWest;
	}
	public void setPlaceSouthWest(String placeSouthWest) {
		this.placeSouthWest = placeSouthWest;
	}
	public String getPlaceNorthEast() {
		return placeNorthEast;
	}
	public void setPlaceNorthEast(String placeNorthEast) {
		this.placeNorthEast = placeNorthEast;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getPlaceAddr() {
		return placeAddr;
	}
	public void setPlaceAddr(String placeAddr) {
		this.placeAddr = placeAddr;
	}
}
