/*
 * Clase para el manejo de la conexion a la Base de Datos
 * implementanda mediante un Pool de Conexiones
 */

package desktopapplication1;

import java.sql.*;
import javax.sql.*;
import java.sql.ResultSet;
import javax.naming.*;

/**
 *
 * @author Victor Alfonso Lopez Canchola
 * @author Alberto Sanchez Gonzalez
 *
 */
public class Conexion {

    private Connection conexion = null;
    private ResultSet cdr = null;
    private Statement sentenciaSQL = null;
    private DataSource fuenteDatos = null;
    String errorInicial = null;

    /**
     * Obtiene la fuente de datos Datasource
     * desde el contexto al realizar la instancia de la clase
     */
    public Conexion(){


          try {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
      conexion = DriverManager.getConnection("jdbc:mysql:///trade","trade", "trade");

      //if(!
              conexion.isClosed();
              //)
        //System.out.println("Successfully connected to MySQL server using TCP/IP...");

    } catch(Exception e) {
      System.err.println("Exception: " + e.getMessage());
    }
//        try {
//            Context initContext = new InitialContext();
//            Context ctx = (Context)initContext.lookup("java:/comp/env");
//            fuenteDatos = (javax.sql.DataSource)ctx.lookup("jdbc/poolSimulador");
//            //System.out.println("Conexion(E)");
//        }
//        catch(NameNotFoundException e) {
//            System.out.println("Error 1: " + e.getMessage());
//        }
//        catch(Exception e) {
//            System.out.println("Error 1: " + e.getMessage());
//        }
    }

    /**
     * Obtiene la conexion de la fuente de datos
     * @return Conexion
     */
    public Connection abrirConexion(){
        String errorPeticion = null;

        try
        {
            if ( errorInicial == null ) {
                conexion = fuenteDatos.getConnection();
            }
        }
        catch( Exception e) {
            errorPeticion = new String(e.toString());
            System.out.println("Error 2(abrirConexion): " + e.getMessage());
        }

        System.out.println(".::Abrir conexion OK::.");
        return conexion;
    }

    /**
     * Cierra la conexion
     * @throws java.sql.SQLException
     */
    public void cerrarConexion()
    {
        try {
		    if (conexion != null )
		    	if ( !conexion.isClosed() ){
		    		conexion.close();
                    System.out.println(".::Cerrar conexion OK::.");
                }
		}
		catch (SQLException e) {
            System.out.println("Error 3(cerrarConexion): " + e.getMessage());
        }
    }

    /**
     * Regresa el ResultSet con el resultado de una consulta
     * @param query Consulta a realizar
     * @return ResulSet con el resultado de la consulta
     */
    public ResultSet consultar(String query){

         try
        {
           sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE); //Crear una sentencia

           cdr = sentenciaSQL.executeQuery(query);
           System.out.println(".::Consultar OK::.");

        }
        catch(SQLException e){System.out.println("Error 4: " + e.getMessage());}

        return cdr;
    }

    /**
     * Metodo que realiza operaciones de actualizacion sobre
     * la base de datos(insert/update/delete)
     * @param query Consulta con la actualizacion o insercion a la base
     * @return Numero de registros afectados
     */
    public int actualizar(String query)
    {
        int registros_afectados = 0;

        try
        {
           sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE); //Crear una sentencia

           registros_afectados = sentenciaSQL.executeUpdate(query);
           System.out.println(".::Actualizar OK::.");

        }

        catch(SQLException e){System.out.println("Error 5: " + e.getMessage());}

        return registros_afectados;
    }

    /**
     * Regresa la instancia de la conexion
     * @return
     */
    public Connection getConnection() {
		return this.conexion;
	}

    /**
     * El método indica si hay una conexion abierta o no.
     * @return
     */
	public boolean existeConexion(){
		if (conexion != null) {
			return true;
		} else {
			return false;
		}
	}

	
	/*************************************************
 * Operaciones a la base con el PreparedStatement
 *************************************************/

    // Función para consultar la base
    public ResultSet consultar(PreparedStatement ps){

        try{
            System.out.println("QUERY:\n ["+ps.toString().substring(40)+"]");

           cdr = ps.executeQuery();
           System.out.println(".::Consultar OK::.");
        }
        catch(SQLException e){System.out.println("Error 4: " + e.getMessage());}

        return cdr;
    }

    /**
     * Función para actulizar e insertar datos en la base datos mediante un PreparedStatement
     * @param ps
     * @return Numero de registros afectados
     */
    public int actualizar(PreparedStatement ps){

        int registros_afectados = 0;

        try
        {
            System.out.println("QUERY:\n ["+ps.toString().substring(40)+"]");

           registros_afectados = ps.executeUpdate();
           
        }
        catch(SQLException e){System.out.println("Error 5: " + e.getMessage());}

        System.out.println(" --  Registros afectados: ["+registros_afectados+"]");

        return registros_afectados;
    }

    public Connection getConexion() {


        return conexion;
    }
    /**
     * Metodo que se encarga de cerrar la conexion
     */
    public void terminarConexion()
    {
        try {
		    if (conexion != null )
		    	if ( !conexion.isClosed() ){
		    		conexion.close();
                    System.out.println(".::Cerrar conexion OK::.");
                }
		}
		catch (SQLException e) {
            System.out.println("Error 3(cerrarConexion): " + e.getMessage());
        }
    }


    public static void main(String arg[]) throws SQLException{

        Conexion algo = new Conexion();
        ResultSet ald=algo.consultar("select * from Marca");

       while(ald.next()){
           System.out.println(ald.getString("idMarca")+"::"+ ald.getString("descripcion"));
       }

        algo.cerrarConexion();

    }
}
