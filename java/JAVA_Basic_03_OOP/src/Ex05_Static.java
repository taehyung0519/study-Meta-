import kr.or.kosa.AirPlane;

public class Ex05_Static {

	public static void main(String[] args) {
		/*
   	   AirPlane air101 = new AirPlane();
   	   air101.makeAirPlane(707, "대한항공");
   	   
       AirPlane air102 = new AirPlane();
	   air101.makeAirPlane(708, "대한항공");
	   
	   AirPlane air103 = new AirPlane();
   	   air101.makeAirPlane(709, "대한항공");
   	   
   	   air101.airPlaneTotalCount();
   	   */
		 AirPlane air101 = new AirPlane(707,"대한항공");
		 air101.airDisplay();
		 air101.airPlaneTotalCount();
	}

}
