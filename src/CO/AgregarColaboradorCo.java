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
		colaborador.setNombre(request.getParameter("nombre"));
		colaborador.setApellidos(request.getParameter("apellidos"));
		colaborador.setCedula(Integer.parseInt(request.getParameter("cedula")));
		colaborador.setCorreo(request.getParameter("correo"));
		colaborador.setDireccion(request.getParameter("direccion"));
		colaborador.setNivelIngles(Integer.parseInt(request.getParameter("nivelIngles")));
		colaborador.setTelefonoCasa(Integer.parseInt(request.getParameter("telCasa")));
		colaborador.setTelefonoCelular(Integer.parseInt(request.getParameter("telCelular")));
		colaborador.setObservaciones(request.getParameter("observaciones"));	
		
	}

	
}
