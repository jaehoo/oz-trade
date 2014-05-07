/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.slf4j.Logger;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.MappingSqlQuery;

/**
 *
 * @author alberto
 */
public class main {

    private static Logger logger;

    // SPRING
    public static BeanFactory factory;
    private static JdbcTemplate jt;


    public static void main(String arg[]){

        try {
           factory = getBeanFactory();
        } catch (Exception ex) {
            logger.error("Error al crear la fuente de datos:", ex);
        }
//
       ServiceDAO obj= (ServiceDAO) factory.getBean("serviceDAO");

        obj.actualizar("update Categoria set descripcion='Cremería y Abarrotes' where idCategoria=3;");
        obj.actualizar("update Categoria set descripcion='Otros' where idCategoria=4;");
        obj.cerrarConexion();



//        JdbcTemplate template = (JdbcTemplate)factory.getBean("jdbcTemplate");
//
//
//        List names = template.query("SELECT descripcion FROM Categoria",
//	new RowMapper() {
//
//            public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
//
//                return rs.getString(1);
//            }
//
//	});
//
//
//        int youngUserCount = template.queryForInt("SELECT idCategoria FROM Categoria WHERE idCategoria <= ?",
//	new Object[] { new Integer(1) });
//
//        System.out.println("-----------"+youngUserCount);
//
//        for (Object object : names) {
//            System.out.println(object.toString()+"==");
//        }
//


            // Utilizando llas librerias de Spring para consultar la bnase
        // *************************************************

        /*UserQuery obs=new UserQuery((DataSource)factory.getBean("dataSource"));
        User user= new User();
        user=obs.findUser(2);

        System.out.println(user.getId()+"== "+ user.getForename());*/
        // *************************************************


//        obj.actualizar("update Categoria set descripcion='Otros' where idCategoria=4;");
        
     }

    private static BeanFactory getBeanFactory() throws Exception {
        // get the bean factory
        return new XmlBeanFactory(new FileSystemResource("src/beto.xml"));
        //return factory;
    }

}

class UserQuery extends MappingSqlQuery {

	public UserQuery(DataSource datasource) {
		super(datasource, "SELECT * FROM Categoria WHERE idCategoria = ?");
		declareParameter(new SqlParameter(Types.NUMERIC));
		compile();
	}

	// Map a result set row to a Java object
	protected Object mapRow(ResultSet rs, int rownum) throws SQLException {
		User user = new User();
		user.setId(rs.getLong("idCategoria"));
		user.setForename(rs.getString("descripcion"));
		return user;
	}

	public User findUser(long id) {
		// Use superclass convenience method to provide strong typing
		return (User) findObject(id);
	}
}


class User{
     private Long id;
     private String forename;

    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return the forename
     */
    public String getForename() {
        return forename;
    }

    /**
     * @param forename the forename to set
     */
    public void setForename(String forename) {
        this.forename = forename;
    }


}