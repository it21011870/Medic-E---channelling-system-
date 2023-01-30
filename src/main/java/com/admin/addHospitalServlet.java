package com.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class addHospitalServlet
 */
@MultipartConfig
@WebServlet("/addHospitalServlet")
public class addHospitalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addHospitalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out =response.getWriter();
		response.setContentType("text/html");
		
		System.out.println("Servlet connected");
		Part file = request.getPart("image");
		String imageFileName = file.getSubmittedFileName();
		System.out.println("File name "+imageFileName);
		String uploadPath="C:/Users/sheha/OneDrive - Sri Lanka Institute of Information Technology/OOP Final/Medic/src/main/webapp/HospitalLogo/"+imageFileName;
		
		try
		{
			FileOutputStream fos=new FileOutputStream(uploadPath);
			InputStream is=file.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		String Hid = request.getParameter("HID");
		String Name = request.getParameter("Name");
		String Location = request.getParameter("Location");
		String phone = request.getParameter("phone");
		String Email = request.getParameter("Email");
		String Password = request.getParameter("password1");
		
		boolean isTrue;
		
		isTrue = HospitalDBUtil.insertHospital(Hid, Name, Location, phone, Email, Password, imageFileName);
		
		if(isTrue==true) {
			out.println("<script type='text/javascript'>");
			out.println("alert('Account creation successfully!')");
			out.println("</script>");
			RequestDispatcher dis = request.getRequestDispatcher("ManageUsers.jsp");
			dis.forward(request, response);
		}
		else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Account creation failed')");
			out.println("location='AddHospital.jsp'");
			out.println("</script>");
			
		}
		
		
	}

}
