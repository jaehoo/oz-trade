/*
 * Clase para el manejo de la conexion a la Base de Datos
 */

package model;


import javax.sql.DataSource;

import model.Conexiones;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;


/**
 *
 * @author Alberto Sanchez Gonzalez
 *
 */
public class Conexion3 implements Conexiones {

    // sfl4j log
    private static Logger logger;
    
    // SPRING
    private JdbcTemplate jt= null;

    public Conexion3(){

        logger = LoggerFactory.getLogger(this.getClass().getName());
        logger.info("[ {} ]", this.getClass().getName());
    }

    public DataSource getDataSource() {

        logger.debug("Obtener DataSource...");
         
        return getJt().getDataSource();
    }

    /**
     * @return the jt
     */
    public JdbcTemplate getJt() {
        return jt;
    }

    /**
     * @param jt the jt to set
     */
    public void setJt(JdbcTemplate jt) {
        this.jt = jt;
    }

}