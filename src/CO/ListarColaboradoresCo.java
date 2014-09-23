package CO;

import java.io.IOException;
import java.sql.SQLException;
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
        private ColaboradorDao colaboradorDao;
        
        @Override
        public void init() throws ServletException{
                this.colaboradorDao = new ColaboradorDao();
        }
        
        public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
        int page = 0;
        int recordsPerPage = 4;                
                        
        if(request.getParameter("page") == null){
        	page = 1;
        }else{
            page = Integer.parseInt(request.getParameter("page"));
        }
        ArrayList<ColaboradorBo> colaboradores = colaboradorDao.buscarColaboradores((page-1)*recordsPerPage, recordsPerPage);                
        int noOfRecords = colaboradorDao.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        request.setAttribute("tblColaboradores", colaboradores);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("ListarColaboradores.jsp");
        
        }
        
        public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
        	try {
				colaboradorDao.eliminarColaboradores( request.getParameterValues("idCbx"));
				response.sendRedirect("ListarColaboradores.jsp");
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
}