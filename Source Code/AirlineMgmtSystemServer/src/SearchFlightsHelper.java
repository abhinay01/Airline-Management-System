import java.sql.SQLException;

import javax.jws.WebService;

import beanFiles.ActiveReservationsBean;

import java.util.Date;
//import java.sql.Connection;

import fdpackage.*;

@WebService
public class SearchFlightsHelper {
	DatabaseConnection connection=null;
	
	public SearchFlightsHelper(){
		connection = new DatabaseConnection();
	}

	// To search one-way flight for a customer
	public FlightDetailsBean[] searchOneWayFlight(FlightDetailsBean flightdetails){
	//	FlightDetailsBean[] matchflightdetails = new FlightDetailsBean[500];
		FlightDetailsBean[] matchedflightdetails = connection.searchOneWayFlight(flightdetails);
		return matchedflightdetails;		
	}
	
	// To Search Return Flight for a customer
	public FlightDetailsBean[] searchReturnFlight(FlightDetailsBean flightdetails){
		FlightDetailsBean[] matchflightdetails = new FlightDetailsBean[500];
		return matchflightdetails; 		
	}
	
	// To search and return all the cancelled flights at any date
	public FlightDetailsBean[] searchCancelledFlights(Date date){
		FlightDetailsBean[] cancelledFlights = new FlightDetailsBean[100];
		return cancelledFlights; 			
	}
	
	// To search a already booked flight by booking reference id provided by customer
	public FlightDetailsBean searchFlightByBookingId(FlightDetailsBean flightdetails){
		FlightDetailsBean matchedflightId = new FlightDetailsBean();
		return matchedflightId;
	}
	
	//To search a customer by booking referenceId or emailId 
	public CustomerBean searchCustomerByBookingIdRef(CustomerBean cust) {
		CustomerBean customer = new CustomerBean();
		return customer;
	} 
	
	public FlightListBean[] getFlightlist(){
		//FlightListBean[] flightlist = new FlightListBean[1000];
		FlightListBean[] flightlist = connection.getFlightList();
		return flightlist;
	}
	
	public boolean updateFlight(FlightListBean flight)
	{
		boolean flag = connection.updateFlight(flight);
		return flag;
	}
	
	public FlightListBean getFlightInfo(FlightListBean flbean) {
		FlightListBean flightinfobean = new FlightListBean();
		flightinfobean = connection.getFlightInfo(flbean);
		return flightinfobean;
	}
	
	public ActiveReservationsBean[] loadReservationsForFlight(int flightId) throws Exception 
	{
	//	ActiveReservationsBean[]  activereservations = new ActiveReservationsBean();
		ActiveReservationsBean[] activereservations = connection.loadReservationsForFlight(flightId);
		return activereservations;
		
		
	}
}
