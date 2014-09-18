package CO;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BO.ColaboradorBo;
import DAO.ColaboradorDao;

public class ListarColaboradoresCo extends HttpServlet{

	private static final long serialVersionUID = 451241225146404184L;
	private ColaboradorBo colaboradorBo;
	private ColaboradorDao colaboradorDao;
	
	@Override
	public void init() throws ServletException{
		this.colaboradorBo = new ColaboradorBo();
		this.colaboradorDao = new ColaboradorDao();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		ArrayList<ColaboradorBo> colaboradores = this.colaboradorDao.buscarColaboradores();		

			request.setAttribute("colaboradores", colaboradores);
			response.sendRedirect("ListarColaboradores.jsp");
			
	}
}
