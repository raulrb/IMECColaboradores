package CO;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BO.ColaboradorBo;
import DAO.ColaboradorDao;

public class ModificarColaboradorCo extends HttpServlet{
	
	private ColaboradorBo colaboradorBo = null;
	private ColaboradorDao colaboradorDao = null;
	private static final long serialVersionUID = 779710457498713231L;
	
	@Override
	public void init() throws ServletException{
		this.colaboradorBo = new ColaboradorBo();
		this.colaboradorDao = new ColaboradorDao();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(request.getParameter("btnCedulaColaborador")!= null){
		this.colaboradorBo = colaboradorDao.buscarColaborador(Integer.parseInt(request.getParameter("btnCedulaColaborador")));
		request.setAttribute("colaboradorModificar", colaboradorBo);
		request.getRequestDispatcher("/ModificarColaborador.jsp").forward(request, response);
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		String pNvlIngles = request.getParameter("txtNvlIngles");
		String pTelCasa = request.getParameter("txtTelCasa");
		String pTelCel = request.getParameter("txtTelCel");
		
		colaboradorBo.setNombre(request.getParameter("txtNombre"));
		colaboradorBo.setApellidos(request.getParameter("txtApellidos"));
		colaboradorBo.setCedula(Integer.parseInt(request.getParameter("txtCedula")));
		colaboradorBo.setCorreo(request.getParameter("txtEmail"));
		colaboradorBo.setDireccion(request.getParameter("txtDireccion"));
		colaboradorBo.setNivelIngles(Integer.parseInt(esCampoNumeroVacio(pNvlIngles)));
		colaboradorBo.setTelefonoCasa(Integer.parseInt(esCampoNumeroVacio(pTelCasa)));
		colaboradorBo.setTelefonoCelular(Integer.parseInt(esCampoNumeroVacio(pTelCel)));
		colaboradorBo.setObservaciones(request.getParameter("txtObservaciones"));

		
		colaboradorDao.actualizarColaborador(colaboradorBo);
		response.sendRedirect("ListarColaboradores.jsp");
	}
	
	private String esCampoNumeroVacio(String pdato){
		if (pdato == ""){
			return "0";
		}else{
			return pdato;
		}
	}
}
