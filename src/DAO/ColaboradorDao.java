package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.sql.DataSource;

import BO.ColaboradorBo;

public class ColaboradorDao {

	private DataSource pool;
	private Connection conn = null;
	Statement stmt = null;
	private int noOfRecords;

	public ColaboradorDao() {
		try {
			// Create a JNDI Initial context to be able to lookup the DataSource
			InitialContext ctx = new InitialContext();
			// Lookup the DataSource, which will be backed by a pool
			// that the application server provides.
			pool = (DataSource) ctx
					.lookup("java:comp/env/jdbc/ColaboradoresDB");
			if (pool == null) {
				throw new ServletException(
						"Unknown DataSource 'jdbc/ColaboradoresDB'");
			}
		} catch (NamingException ex) {
			ex.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}

	}

	public void ingresarColaborador(ColaboradorBo colaboradorBo) {
		// se obtiene la conexion
		try {
			conn = pool.getConnection();

			PreparedStatement pstmt = conn
					.prepareStatement("insert into Colaboradores (cedula, nombre, apellidos, correo, telCasa, telCelular, nivelIngles, direccion, observaciones) values (?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, colaboradorBo.getCedula() + "");
			pstmt.setString(2, colaboradorBo.getNombre());
			pstmt.setString(3, colaboradorBo.getApellidos());
			pstmt.setString(4, colaboradorBo.getCorreo());
			pstmt.setString(5, colaboradorBo.getTelefonoCasa() + "");
			pstmt.setString(6, colaboradorBo.getTelefonoCelular() + "");
			pstmt.setString(7, colaboradorBo.getNivelIngles() + "");
			pstmt.setString(8, colaboradorBo.getDireccion());
			pstmt.setString(9, colaboradorBo.getObservaciones());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close(); // return to pool
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}

	public ArrayList<ColaboradorBo> buscarColaboradores(int offset,
			int pnoOfRecords) {
		String query = "select SQL_CALC_FOUND_ROWS * from Colaboradores limit "
				+ offset + ", " + pnoOfRecords;
		ArrayList<ColaboradorBo> colaboradores = new ArrayList<ColaboradorBo>();
		ColaboradorBo colaboradorBo = null;
		try {
			conn = pool.getConnection();
			stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery(query);
			while (rset.next()) {
				colaboradorBo = new ColaboradorBo();
				colaboradorBo.setCedula(Integer.parseInt(rset
						.getString("cedula")));
				colaboradorBo.setNombre(rset.getString("nombre"));
				colaboradorBo.setApellidos(rset.getString("apellidos"));
				colaboradorBo.setCorreo(rset.getString("correo"));
				colaboradorBo.setTelefonoCelular(Integer.parseInt(rset
						.getString("telCelular")));
				colaboradores.add(colaboradorBo);
			}
			rset.close();

			rset = stmt.executeQuery("SELECT FOUND_ROWS()");

			if (rset.next()) {
				noOfRecords = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close(); // return to pool
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return colaboradores;
	}

	public int getNoOfRecords() {
		return noOfRecords;
	}

	public ColaboradorBo buscarColaborador(int cedula) {
		ColaboradorBo colaboradorBo = null;
		try {
			conn = pool.getConnection();
			stmt = conn.createStatement();

			PreparedStatement pstmt = conn
					.prepareStatement("SELECT * FROM Colaboradores c where c.cedula = ?");
			pstmt.setString(1, cedula + "");
			ResultSet rset = pstmt.executeQuery();
			while (rset.next()) {
				colaboradorBo = new ColaboradorBo();
				colaboradorBo.setCedula(Integer.parseInt(rset
						.getString("cedula")));
				colaboradorBo.setNombre(rset.getString("nombre"));
				colaboradorBo.setApellidos(rset.getString("apellidos"));
				colaboradorBo.setCorreo(rset.getString("correo"));
				colaboradorBo.setDireccion(rset.getString("direccion"));
				colaboradorBo.setNivelIngles(Integer.parseInt(rset
						.getString("nivelIngles")));
				colaboradorBo.setObservaciones(rset.getString("observaciones"));
				colaboradorBo.setTelefonoCasa(Integer.parseInt(rset
						.getString("telCasa")));
				colaboradorBo.setTelefonoCelular(Integer.parseInt(rset
						.getString("telCelular")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close(); // return to pool
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return colaboradorBo;
	}

	public void eliminarColaboradores(String[] idColaboradores) throws NumberFormatException, SQLException {
		conn = pool.getConnection();
		PreparedStatement pstmt;
		String deleteSQL = "DELETE FROM Colaboradores  WHERE cedula = ?";
		try{
			for (int  i=0; i < idColaboradores.length; i++){
				pstmt = conn.prepareStatement(deleteSQL);
				pstmt.setInt(1, Integer.parseInt(idColaboradores[i]));
				pstmt.executeUpdate();	
			}
		}catch (SQLException e) {
			e.printStackTrace();	
		}finally{
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close(); // return to pool
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}

		public void actualizarColaborador(ColaboradorBo colaboradorBo) {
			

			try {
				 conn = pool.getConnection();

                 PreparedStatement pstmt = conn
                                 .prepareStatement("update Colaboradores set nombre = ?, apellidos = ?, correo = ?, telCasa = ?, telCelular = ?,nivelIngles =  ?, direccion = ?, observaciones = ? where cedula = ?");
                 pstmt.setString(1, colaboradorBo.getNombre());
                 pstmt.setString(2, colaboradorBo.getApellidos());
                 pstmt.setString(3, colaboradorBo.getCorreo());
                 pstmt.setString(4, colaboradorBo.getTelefonoCasa()+"");
                 pstmt.setString(5, colaboradorBo.getTelefonoCelular()+"");
                 pstmt.setString(6, colaboradorBo.getNivelIngles()+"");
                 pstmt.setString(7, colaboradorBo.getDireccion());
                 pstmt.setString(8, colaboradorBo.getObservaciones());
                 pstmt.setString(9, colaboradorBo.getCedula()+"");

                 pstmt.executeUpdate();                                
                
        } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
        } finally {
                try {
                        if (stmt != null)
                                stmt.close();
                        if (conn != null)
                                conn.close(); // return to pool
                } catch (SQLException ex) {
                        ex.printStackTrace();
                }
        }
		}

}
		
