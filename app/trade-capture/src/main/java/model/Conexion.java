/*
 * Clase para el manejo de la conexion a la Base de Datos
 */

package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.core.util.StatusPrinter;


/**
 *
 * @author Alberto Sanchez Gonzalez
 *
 */
public class Conexion{

    private Connection conexion = null;
    private ResultSet rs = null;
    private Statement sentenciaSQL = null;

    private static Logger logger;
    private int registros_afectados;

    public Conexion(){

    logger = LoggerFactory.getLogger(Conexion.class);
    logger.info("[ Conexion ]");
    
        try {
            logger.info("Cargando JDBC Driver");
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            } catch (Exception e) {
            logger.error("some accompanying message", e);
        }
    }

    public synchronized void abrirConexion() {
        try {

            if(conexion==null  || conexion.isClosed()){
                conexion= DriverManager.getConnection("jdbc:mysql:///trade", "trade", "trade");
                logger.debug("[ Conexion abierta ]");
            }

        } catch (SQLException e) {
            logger.error(" Error al abrir la conexion: ", e);
        }

    }

    public synchronized void cerrarConexion()
    {
        try {
            if (conexion!= null && !conexion.isClosed() ){
                conexion.close();
                logger.debug("[ Conexion cerrada ]");
            }
        }catch (SQLException e) {
            logger.error("Error al cerrar la conexion:", e);
        }
    }

    public synchronized ResultSet consultar(String query){

        try
        {
//             query="ansdklnaskd";
           abrirConexion();
           logger.debug("[ SQL: {} ]",query);
           sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
           rs = sentenciaSQL.executeQuery(query);
           logger.info("[ Consultar OK ]");

        }
        catch(SQLException e){
            logger.error("Error de sintaxis:", e);
        }
        catch(NullPointerException e){
            logger.error("No se ha creado la conexion", e);
        }
        catch(Exception e){
            logger.error("Error consultar", e);
        }

        return rs;
    }

    public synchronized int actualizar(String query)
    {
        registros_afectados = 0;

        try
        {
           abrirConexion();
           sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE); //Crear una sentencia
           registros_afectados = sentenciaSQL.executeUpdate(query);
           logger.info("[ Actualizar OK, registros afectados: {} ]",registros_afectados);

        }
        catch(SQLException e){
            logger.error("Error de sintaxis:", e);
        }
        catch(NullPointerException e){
            logger.error("No se ha creado la conexion", e);
        }
        catch(Exception e){
            logger.error("Error consultar", e);
        }

        return registros_afectados;
    }


/**
 * Operaciones a efectuar en la base con el PreparedStatement
 *
 **/
  public ResultSet consultar(PreparedStatement ps){

        try{
            
           abrirConexion();
           logger.debug("[ SQL: {} ]",ps);
           rs = ps.executeQuery();
           logger.info("[ Consultar OK ]");
        }
        catch(SQLException e){            logger.error("Error de sintaxis:", e);            }
        catch(NullPointerException e){    logger.error("No se ha creado la conexion", e);   }
        catch(Exception e){               logger.error("Error consultar", e);               }

        return rs;
    }

    public int actualizar(PreparedStatement ps){

        registros_afectados = 0;

        try
        {
           abrirConexion();
           logger.debug("[ SQL: {} ]",ps);
           registros_afectados = ps.executeUpdate();
           logger.info("[ Actualizar OK, registros afectados: {} ]",registros_afectados);
        }
        catch(SQLException e){            logger.error("Error de sintaxis:", e);            }
        catch(NullPointerException e){    logger.error("No se ha creado la conexion", e);   }
        catch(Exception e){               logger.error("Error consultar", e);               }

        return registros_afectados;
    }

        /**
     * @return the conexion
     */
    public Connection getConexion() {

        abrirConexion();
        return conexion;
    }

    public static void main(String arg[]) throws SQLException{

        Conexion obj = new Conexion();

        ResultSet rs = obj.consultar("SELECT * FROM Marca");

        while (rs.next()) {
            System.out.println("==" + rs.getString("descripcion"));
        }
        rs.close();
        obj.cerrarConexion();


        PreparedStatement ps;
        String sql="SELECT descripcion from Categoria where idcategoria=?";
        // Se carga el query con sus valores
        ps=obj.getConexion().prepareStatement(sql);
        ps.setInt(1, 1);
        ResultSet rs2= obj.consultar(ps);
        
        while(rs2.next()){
            System.out.println(""+ rs2.getString("descripcion"));
        }

        obj.cerrarConexion();

        obj.actualizar("update Categoria set descripcion='Otros' where idCategoria=4;");
        obj.cerrarConexion();



     }


}