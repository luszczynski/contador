package org.jboss.roadshoweap;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;

@WebServlet(urlPatterns="/ServletUtils")
public class ServletUtils extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	@Inject
	private Logger log;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int cont;
		
		if(session.getAttribute("cont") == null)
			//session.setAttribute("cont",0);
			cont = 0;
		else {
			cont = Integer.parseInt(session.getAttribute("cont").toString());
			cont++;
		}
		
		session.setAttribute("cont",cont);
		
		log.info("Contador = " + cont);
		
		response.getWriter().write(cont + ";" + request.getRemoteHost() + ";" + request.getLocalAddr() + ":" + request.getLocalPort());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();
	}

}
