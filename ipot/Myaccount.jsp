<!doctype html>


<html lang="en" >

<!-- Needs to be implemented -->
<%@ page import="java.util.ArrayList, Proj.boardItem, Proj.problemItem" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat, java.text.ParseException" %>
<%@ page import="Proj.StudentEntity" %>
<jsp:useBean id="boarddb" class="Proj.boardlistDB"></jsp:useBean>
<jsp:useBean id="submitProc" class="Proj.SubmitProcess" scope="page"/>
<jsp:useBean id="studdb" class="Proj.StudentDBCP" scope="page"/>
<jsp:useBean id="logindb" class="Proj.loginProcessBean" scope="page"/>
<%
	ArrayList<boardItem> blin = boarddb.getNewslist();
	ArrayList<problemItem> blic = null;
	ArrayList<String> ClassList = (ArrayList<String>) request.getSession().getAttribute("className");
	ArrayList<String> ClassCode = (ArrayList<String>) request.getSession().getAttribute("classCode");
	
	String LoginID = (String) request.getSession().getAttribute("loginID");
	String priv = (String) request.getSession().getAttribute("priv");
	String sNum = (String) request.getSession().getAttribute("snum");
	String solved[] = submitProc.getSolved(sNum).split(" ");
	String ID = null;
	String title = null;
	String content = null;
	String timeStamp = null;
	String time = null;
	String date = null;
	String isSolved = null;
	String staColor = null;
	float tmp = 0;

	

	String period = null;
	SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	Date result = null;
	boolean isClickable = true;
	
	

%>
	<head>
	
	  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Tables</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
	
	 
  
	
	
		</head>
		</script>
		<style>						
			#top_button {
			  display: none;
			  position: fixed;
			  bottom: 20px;
			  right: 30px;
			  z-index: 99;
			  font-size: 18px;
			  border: none;
			  outline: none;
			  background-color: red;
			  color: white;
			  cursor: pointer;
			  padding: 15px;
			  border-radius: 4px;
			
			
			
			
			
			
			
			
			
			}



\



.bt-admin {
  display: flex;
  overflow: hidden;

  padding: 12px 12px;

  cursor: pointer;
  user-select: none;
  transition: all 150ms linear;
  text-align: center;
  white-space: nowrap;
  text-decoration: none !important;
  text-transform: none;
  text-transform: capitalize;
  }




		</style>
	</head>
<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="Homepage1.html">I-POT</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="index.html" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="Homepage1.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Home</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="quiz.jsp">
          <i class="fas fa-fw fa-folder"></i>
          <span>Quiz</span></a>
       
      </li>
      <li class="nav-item">
        <a class="nav-link" href="listboard.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Notice</span></a>
          </li>
      <li class="nav-item active">
        <a class="nav-link" href="Myaccount.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Myaccount</span></a>
      </li>
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">I-POT</a>
          </li>
          <li class="breadcrumb-item active">Myaccount</li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Data Table Example</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">



                   
						
                        <form method="POST" action="Problem_List.jsp">
                        	<input type="hidden" name="loginId" value="<%= LoginID %>">
                        	<input type="hidden" name="Level" value="<%= priv %>">
                       
                        
                         
                         
                           <h1 class="bp-header__title">My account</h1>
                                          						<%
							StudentEntity ent = studdb.getStudentEntity(sNum);
						%>
                               
                                    <td width="50"> ID:                </td>
                                    <td> <label><%= LoginID %></label> </td>
                                </tr>
                                <br>
                                <tr>
                                	<h2><td width="50"> <label>StudentID:           </label> </td>
                                    <td> <label><%= sNum %></label> </td></h2>
                                </tr>
                                <br>
                                <tr>
                                	<td width="50"> <label>LEVEL:             </label> </td>
                                    <td> <label><%= priv %></label> </td>
                                </tr>
                                <br>
                                <tr>
                                	<td width="50"> <label>Name:</label> </td>
                                    <td> <label><%=ent.getName()%></label> </td>
                                </tr>
                                <br>
                                <tr>
                                	<td width="50"><label>E-Mail:</label> </td>
                                    <td> <label><%=ent.getEmail()%></label> </td>
                                </tr>
                                <br>
                                <tr>
                                	<td width="50"><label>Phone Number:</label> </td>
                                    <td> <label><%=ent.getPhone()%></label> </td>
                                </tr>	
                                <br>	
                                
                                </h1>						 
								
								<br>
								</tr>
								</h2>
								</table>
<%
								if (priv.equals("2"))
								{
%>
                                    <td>
                                    <center>
                                    	<input  class="bt-admin -flower" type="submit" value="ADMIN">
                                    </center>
                                    </td>
<%
                                }
%>




 </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

        <p class="small text-center text-muted my-5">
          <em>More table examples coming soon...</em>
        </p>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="index.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>










</a>
		
			</a>
		</div>
	</body>
</html>
