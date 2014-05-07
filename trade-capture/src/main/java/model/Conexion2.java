/*
 * Clase para el manejo de la conexion a la Base de Datos
 */

package app.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author Alberto Sanchez Gonzalez
 *
 */
public class Conexion2{

    private static Connection conexion = null;
    private ResultSet rs = null;
    private Statement sentenciaSQL = null;

    private static Logger logger;
    private int registros_afectados;

    private boolean rollback;

    private static MysqlDataSource dataSource;

    public Conexion2(){

        logger = LoggerFactory.getLogger(Conexion2.class);
        logger.info("[ Conexion ]");

    }

    private synchronized MysqlDataSource getDataSource() {

        if(dataSource==null){
            logger.debug("Creando... DataSource");
            dataSource = new MysqlDataSource();

            dataSource.setUser("root");
            dataSource.setPassword("root");

            //dataSource.setDatabaseName("trade");
            //dataSource.setServerName("localhost");
            //dataSource.setPort(3306);
            dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/trade");

            logger.debug("DataSource OK");
        }

        return dataSource;
    }

    public synchronized void cerrarConexion()
    {
        try {

            if(rollback){
                rollback();
            }else{
                commit();
            }

            logger.info("Transaccion completa: [ {} ]", !rollback);

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
    public synchronized Connection getConexion() throws SQLException, NullPointerException {
        
        if(conexion==null || conexion.isClosed()){
            conexion=getDataSource().getConnection();
            logger.debug("Obtener... conexion");
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


    public static void main(String arg[]) throws SQLException{

        Conexion2 obj = new Conexion2();

        /*ResultSet rs = obj.consultar("SELECT * FROM Categoria");

        while (rs.next()) {
            System.out.println("==" + rs.getString("descripcion"));
        }
        rs.close();*/
        

        PreparedStatement ps;
        String sql="select * from Categoria";
        // Se carga el query con sus valores
        ps=obj.getConexion().prepareStatement(sql);
        //ps.setInt(1, 4);
        //ps=null;
        ResultSet x= obj.consultar(ps);

        if(x!=null)
            while(x.next())
                System.out.println(x.getString(2));

        obj.cerrarConexion();

        sql="update Categoria set descripcion='Otros' where idCategoria=?;";
        // Se carga el query con sus valores
        ps=obj.getConexion().prepareStatement(sql);
        ps.setInt(1, 4);
        //ps=null;
        obj.actualizar(ps);
        ps.close();

//
//        if(rs2!=null)
//        while(rs2.next()){
//            System.out.println(""+ rs2.getString("descripcion"));
//        }

        obj.cerrarConexion();

       /*
        obj.actualizar("update Categoria set descripcion='Cremería y Abarrotes' where idCategoria=3;");

        obj.actualizar("update Categoria set descripcion='Otros' where idCategoria=4;");
        obj.cerrarConexion();
        obj.actualizar("update Categoria set descripcion='OtrosX' where idCategoria=4;");
*/
        obj.cerrarConexion();
         


     }


}