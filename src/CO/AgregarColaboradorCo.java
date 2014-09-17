package CO;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BO.ColaboradorBo;

public class AgregarColaboradorCo extends HttpServlet{

	private ColaboradorBo colaborador;
	
	public void init() throws ServletException{
		this.colaborador = new ColaboradorBo();
	}
	private static final long serialVersionUID = 826986885787403188L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		
		response.setContentType("text/html");
		colaborador.setNombre(request.getParameter("txtNombre"));
		colaborador.setApellidos(request.getParameter("txtApellidos"));
		colaborador.setCedula(Integer.parseInt(request.getParameter("txtCedula")));
		colaborador.setCorreo(request.getParameter("txtEmail"));
		colaborador.setDireccion(request.getParameter("txtDireccion"));
		colaborador.setNivelIngles(Integer.parseInt(request.getParameter("txtNvlIngles")));
		colaborador.setTelefonoCasa(Integer.parseInt(request.getParameter("txtTelCasa")));
		colaborador.setTelefonoCelular(Integer.parseInt(request.getParameter("txtTelCel")));
		colaborador.setObservaciones(request.getParameter("txtObservaciones"));	
		
	}

	
}
