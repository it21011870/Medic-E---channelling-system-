<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Medic</title>
  <!-- ================================================ Google Fonts ================================================================== -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
    rel="stylesheet">

  <!-- ================================================ Bootstrap ================================================================== -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <!-- ================================================ Font Awsome ================================================================== -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

  <!-- ================================================ Custom CSS ================================================================== -->
  <link rel="Stylesheet" href="styles/header.css" />
  <link rel="Stylesheet" href="styles/home page.css" />
  <link rel="Stylesheet" href="styles/footer.css" />
  <link rel="Stylesheet" href="styles/counter.css" />
  <link rel="Stylesheet" href="styles/searchbar.css" />
  <link rel="stylesheet" href="styles/sidebar.css">
  <link rel="stylesheet" href="styles/admin.css">
  
  <style>
  	input[type=text] {
  width: 600px;
  padding: 0;
  margin: 0;
 
}
  </style>
	
</head>
<body>

  <div id="head">
    <header>
      <img class="logo" src="images/Medic logo.png" alt="logo">

      <nav class="navi">
        <a href="AdminHomepage.jsp" class="navi-item is-active" active-color="rgba(0, 56, 255, 1)">HOME</a>
        <a href="#" class="navi-item" active-color="rgba(0, 56, 255, 1)">Doctor's near you</a>
        <a href="#" id="covidnews" class="navi-item" active-color="rgba(0, 56, 255, 1)">Covid19<span class="dot"></span></a>
        <span class="navi-indicator"></span>
      </nav>
      
    </header>
  </div>

  <main>
    <div class="row">
      <div class="col-2 sidebar">
        <img class="nav logo-side" src="images/Medic logo.png" alt="logo">
        <ul class="nav flex-column nav-pills">
          <li class="nav-item ">
            <a class="nav-link sidebar-link" href="AdminDashboard.jsp"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active  toggle sidebar-link"  href="ManageUsers.jsp"><i class="fa-solid fa-calendar"></i> Manage Users</a>
          
          </li>
          <li class="nav-item">
            <a class="nav-link sidebar-link" href="AdminProfile.jsp"><i class="fa-solid fa-user"></i> Profile</a>
          </li>
          <li class="nav-item">
            <a class="nav-link sidebar-link logout-btn" href="logout"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
          </li>
        </ul>
      </div>
    </div>
    <div class="region-main">
	<div class="animate">
        <h1 class="">Manage hospital account</h1>
        
        <form action="searchhos" method="post">
        	<br><br>
        	<input type="text" name="search" placeholder="Enter hospital name" > 
        	<input type="submit" name="submit" value="Search">
        	<br><br><br>
        </form>
       
        <c:forEach var="hos" items="${hosDetails}">
        	<c:set var = "name" value="${hos.name}"/>
        	<c:set var = "phone" value="${hos.phone}"/>
        	<c:set var = "email" value="${hos.email}"/>
        	<c:set var = "password" value="${hos.password}"/>
        	<c:set var = "HID" value="${hos.HID}"/>
        	<c:set var = "location" value="${hos.location}"/>
        	<c:set var = "logoName" value="${hos.logoName}"/>
        	
        	
        	
        <c:url value="ManageHospital.jsp" var="hosDelete">
        	<c:param name="name" value = "${name}"/>
        	<c:param name="phone" value = "${phone}"/>
        	<c:param name="email" value = "${email}"/>
        	<c:param name="password" value = "${password}"/>
        	<c:param name="HID" value = "${HID}"/>
        	<c:param name="Location" value = "${location}"/>
        	<c:param name="logoName" value = "${logoName}"/>        	
        </c:url>
        	
        		<div class='four-col-profile hove'>
                     <center>
                          <img src="HospitalLogo/${hos.logoName}"  style='border : px solid #ddd ; border-radius : 60px ; padding : 3px ; width : 150px; height : 180px ;'>
                          <h6 class='profile-names-grid'>${hos.name} Hospital</h6>
                          <a href = "${hosDelete }"><button class='btn-view-profile'>Manage Profile</button></a>
                     </center>
                </div>
        </c:forEach>
 
	</div>
    </div>
  </main>


</body>
</html>