package DefaultNamespace;

public class SearchFlightsHelperProxy implements DefaultNamespace.SearchFlightsHelper {
  private String _endpoint = null;
  private DefaultNamespace.SearchFlightsHelper searchFlightsHelper = null;
  
  public SearchFlightsHelperProxy() {
    _initSearchFlightsHelperProxy();
  }
  
  public SearchFlightsHelperProxy(String endpoint) {
    _endpoint = endpoint;
    _initSearchFlightsHelperProxy();
  }
  
  private void _initSearchFlightsHelperProxy() {
    try {
      searchFlightsHelper = (new DefaultNamespace.SearchFlightsHelperServiceLocator()).getSearchFlightsHelper();
      if (searchFlightsHelper != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)searchFlightsHelper)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)searchFlightsHelper)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (searchFlightsHelper != null)
      ((javax.xml.rpc.Stub)searchFlightsHelper)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public DefaultNamespace.SearchFlightsHelper getSearchFlightsHelper() {
    if (searchFlightsHelper == null)
      _initSearchFlightsHelperProxy();
    return searchFlightsHelper;
  }
  
  public fdpackage.FlightListBean[] getFlightlist() throws java.rmi.RemoteException{
    if (searchFlightsHelper == null)
      _initSearchFlightsHelperProxy();
    return searchFlightsHelper.getFlightlist();
  }
  
  public fdpackage.CustomerBean searchCustomerByBookingIdRef(fdpackage.CustomerBean cust) throws java.rmi.RemoteException{
    if (searchFlightsHelper == null)
      _initSearchFlightsHelperProxy();
    return searchFlightsHelper.searchCustomerByBookingIdRef(cust);
  }
  
  public fdpackage.FlightDetailsBean searchFlightByBookingId(fdpackage.FlightDetailsBean flightdetails) throws java.rmi.RemoteException{
    if (searchFlightsHelper == null)
      _initSearchFlightsHelperProxy();
    return searchFlightsHelper.searchFlightByBookingId(flightdetails);
  }
  
  public fdpackage.FlightDetailsBean[] searchOneWayFlight(fdpackage.FlightDetailsBean flightdetails) throws java.rmi.RemoteException{
    if (searchFlightsHelper == null)
      _initSearchFlightsHelperProxy();
    return searchFlightsHelper.searchOneWayFlight(flightdetails);
  }
  
  public fdpackage.FlightDetailsBean[] searchReturnFlight(fdpackage.FlightDetailsBean flightdetails) throws java.rmi.RemoteException{
    if (searchFlightsHelper == null)
      _initSearchFlightsHelperProxy();
    return searchFlightsHelper.searchReturnFlight(flightdetails);
  }
  
  public fdpackage.FlightDetailsBean[] searchCancelledFlights(java.util.Calendar date) throws java.rmi.RemoteException{
    if (searchFlightsHelper == null)
      _initSearchFlightsHelperProxy();
    return searchFlightsHelper.searchCancelledFlights(date);
  }
  
  public beanFiles.ActiveReservationsBean[] loadReservationsForFlight(int flightId) throws java.rmi.RemoteException{
    if (searchFlightsHelper == null)
      _initSearchFlightsHelperProxy();
    return searchFlightsHelper.loadReservationsForFlight(flightId);
  }
  
  public fdpackage.FlightListBean getFlightInfo(fdpackage.FlightListBean flbean) throws java.rmi.RemoteException{
    if (searchFlightsHelper == null)
      _initSearchFlightsHelperProxy();
    return searchFlightsHelper.getFlightInfo(flbean);
  }
  
  public boolean updateFlight(fdpackage.FlightListBean flight) throws java.rmi.RemoteException{
    if (searchFlightsHelper == null)
      _initSearchFlightsHelperProxy();
    return searchFlightsHelper.updateFlight(flight);
  }
  
  
}