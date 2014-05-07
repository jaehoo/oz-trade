/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author alberto
 */
public class ServiceDAO {

    
    // Mysql
    private static Connection conexion = null;
    private ResultSet rs = null;
    private Statement sentenciaSQL = null;
    private boolean rollback;
    private int registros_afectados;

    // SFL4J
    private static Logger logger;

    // Spring
    private Conexiones conexionSource = null;


    public ServiceDAO(){

        logger = LoggerFactory.getLogger(this.getClass().getName());
        logger.info("[ {} ]", this.getClass().getName());

    }

    public synchronized void cerrarConexion()
    {
        try {

            logger.info("Transaccion completa: [ {} ]", !rollback);

            if(rollback){
                rollback();
            }else{
                commit();
            }

            if (conexion!= null && !conexion.isClosed() ){
                    conexion.close();
                logger.debug("[ Conexion cerrada ]");
            }
        }catch (SQLException e) {
            logger.error(" Error al cerrar la conexion:", e);
        }
    }

    public synchronized ResultSet consultar(String query){

        try
        {
           logger.debug("SQL: [ {} ]",query);
           sentenciaSQL = getConexion().createStatement();
           rs = sentenciaSQL.executeQuery(query);
           logger.info("Consultar: [ ok ]");

        }
        catch(SQLException e){
            rollback=true;
            logger.info("Error SQL: [ {} ]", query);
            logger.error("Error sql:", e);
        }
        catch(NullPointerException e){
            rollback=true;
            logger.error("Error: ", e);
        }
        catch(Exception e){
            rollback=true;
            logger.error("Error consultar:", e);
        }
        return rs;
    }

    public synchronized int actualizar(String query)
    {
        try {

            sentenciaSQL = getConexion().createStatement();
            logger.debug("SQL: [ {} ]", query);

            registros_afectados = 0;
            registros_afectados = sentenciaSQL.executeUpdate(query);
            logger.info("Actualizar [ ok ], registros afectados: [ {} ]", registros_afectados);
        }
        catch(SQLException e){
            rollback=true;
            logger.info("Error SQL: [ {} ]", query);
            logger.error("Error sql:", e);
        }
        catch(NullPointerException e){
            rollback=true;
            logger.error("Error: ", e);
        }
        catch(Exception e){
            rollback=true;
            logger.error("Error actualizar:", e);
        }

        return registros_afectados;
    }

/**
 * Operaciones a efectuar en la base con el PreparedStatement
 *
 **/
  public synchronized  ResultSet consultar(PreparedStatement ps){

        try {
            logger.debug("SQL: [ {} ]", ps);
            rs = ps.executeQuery();
            logger.info("Consultar [ ok ]");
        }
        catch(SQLException e){
            rollback=true;
            logger.info("SQL: [ {} ]",ps);
            logger.error("Error sql:", e);
        }
        catch(NullPointerException e){
            rollback=true;
            logger.error("Error:", e);
        }
        catch(Exception e){
            rollback=true;
            logger.error("Error consultar:", e);
        }

        return rs;
    }

    public synchronized void actualizar(PreparedStatement ps){

        try{
           registros_afectados = 0;
           logger.debug("SQL: [ {} ]",ps);
           registros_afectados = ps.executeUpdate();
           logger.info("Actualizar [ ok ], registros afectados: [ {} ]",registros_afectados);
        }
        catch(SQLException e){
            rollback=true;
            logger.info("SQL: [ {} ]",ps);
            logger.error("Error sql:", e);
        }
        catch(NullPointerException e){
            rollback=true;
            logger.error("Error:", e);
        }
        catch(Exception e){
            rollback=true;
            logger.error("Error actualizar:", e);
        }

    }

    /**
     * @return the conexion
     */
    public synchronized Connection getConexion() throws SQLException   {

        if(conexion==null || conexion.isClosed()){
            conexion=getConexionSource().getDataSource().getConnection();
            logger.debug("Obtener conexion ... ");
            rollback=false;
            conexion.setAutoCommit(false);
            logger.debug("Conexion OK, Auto-commit: [ {} ]",conexion.getAutoCommit());
        }

        return conexion;
    }

    public synchronized void commit(){
        try {

            if(conexion!=null && !conexion.isClosed()){
                conexion.commit();
                logger.debug("Commit: [ ok ]");
            }

        } catch (Exception e) {
            logger.error("Error",e);
        }
    }

    public synchronized void rollback(){
        try {
                if(conexion!=null && !conexion.isClosed()){
                    conexion.rollback();
                    logger.debug("Rollback: [ ok ]");
                }
        } catch (Exception e) {            logger.error("Error",e);        }
    }

    /**
     * @return the conexionSource
     */
    public Conexiones getConexionSource() {
        return conexionSource;
    }

    /**
     * @param conexionSource the conexionSource to set
     */
    public void setConexionSource(Conexiones conexionSource) {
        this.conexionSource = conexionSource;
    }


}
