<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rishi.Modals.DAO" %>

<%
	String name=(String)session.getAttribute("name");
	if(name==null){
		session.setAttribute("msg", "Please Login First!");
		response.sendRedirect("index.jsp");
	}else{
%>

<%
		String msg=(String)session.getAttribute("msg");
    		if(msg!=null){
    	%>
    	<p class="p-2 bg-secondary bg-gradient text-light text-center"><%= msg %></p>
    <%
    	session.setAttribute("msg", null);
    		}
		%>
<!DOCTYPE html>
<html>

<head>
    <title>Admin Page</title>
    <link rel="icon" href="resources/logo.png">

    <meta name="viewport" content="width=device-width initial-scale=1">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />

    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js"
        integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        
  <!-- Lightbox CSS & Script -->
  <script src="resources/lightbox/ekko-lightbox.js"></script>
  <link rel="stylesheet" href="resources/lightbox/ekko-lightbox.css" />

    <!-- AOS CSS & Script -->
    <script src="resources/aos/aos.js"></script>
    <link rel="stylesheet" href="resources/aos/aos.css" />

    <!-- custom css -->
    <link rel="stylesheet" href="resources/costum.css">

    <meta name="author" content="" />
    <meta name="description" content="This is a website for Car Rental." />

</head>

<body>
	
    <nav id="nav" class="navbar navbar-expand-sm container my-3">
        <a href="index.jsp" class="navbar-brand">
            <img src="resources/logo.png" height="35px">
            <label>Car<span>Rental</span></label>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#my-navbar"
            aria-controls="my-navbar" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa-solid fa-bars"></i>
            <span>Menu</span>
        </button>

        <div class="collapse navbar-collapse" id="my-navbar">
            <ul class="navbar-nav mx-auto p-2">
                <li class="m-1">
                    <a href="AdminHome.jsp">Home</a>
                </li>
                <li class="m-1">
                	<a href="Enquiries.jsp"> Enquiries</a>
                </li>	
            </ul>
            
      <label class="bg-primary bg-gradient text-white p-2 rounded mt-2 mx-1"> Welcome: <b><%= name %></b> </label>
      <a class="bg-danger bg-gradient text-white p-2 rounded" href="Logout"> Logout </a>
     
        </div>
    </nav>

    <section class="container p-4">
    	<%
    	DAO db=new DAO();
    	ArrayList<HashMap> carOwners= db.getAllOwners();
    	db.closeConnection();
    	for(HashMap<String,String> carOwner:carOwners){
    	%>
    	<p class="text-center p-2 bg-info">
    		Email I'd: <b><%= carOwner.get("email") %></b>
    		Name: <b><%=carOwner.get("name") %></b>
    		Phone: <b><%= carOwner.get("phone") %></b>
    		Address: <b><%=carOwner.get("address") %></b>
    		
    		<%--  <form action="ViewIDProof" method="post">
		    		<input type="hidden" name="email" value="<%= carOwner.get("email")%>" />
		    		<button class="btn btn-sm btn-secondary">View ID Proof</button>
		    	 </form>  --%>
		    
		    <a class="btn btn-sm btn-secondary" href="ViewIDProof?email=<%= carOwner.get("email")%>" target="blank">View ID Proof</a>
		    	
    		
    		<%
    			String status=(String)carOwner.get("status");
    			if(status.equalsIgnoreCase("Pending")){
    				%>
    				<a href="ChangeCarOwnerStatus?email=<%= carOwner.get("email")%>&status= <%= carOwner.get("status") %>"  class="btn btn-sm btn-success p-1">Accept</a>
    				<a href="ChangeCarOwnerStatus?email=<%= carOwner.get("email")%>&status= <%= carOwner.get("status") %>" class="btn btn-sm btn-danger p-1">Reject</a>
    				<%
    			}
    		%>
    	</p>
    	<%
    	}
    	
    	%>
    	
    </section>
    
   
    <footer class="bg-dark bg-gradient p-5 text-center">
        <a href="index.jsp">
            <img src="resources/logo.png" height="35px">
            <label><b>Car</b><span><b>Rental</b></span></label>
          </a>
          <br/><br>
    <p class="text-light">&copy; Rights Reserved.</p>
    <p>
      <a href="https://www.facebook.com"><i class="fa-brands fa-facebook fa-2x"></i></a>
      <a href="https://www.instagram.com"><i class="fa-brands fa-instagram fa-2x"></i></a>
      <a href="https://www.youtube.com"><i class="fa-brands fa-youtube fa-2x"></i></a>
    </p>
    </footer>
    <label id="top-button"><i class="fa-solid fa-circle-up fa-2x"></i></label>

</body>

</html>
<%
}
%>
