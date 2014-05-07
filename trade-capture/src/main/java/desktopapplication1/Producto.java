/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package desktopapplication1;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 *
 * @author jaehoo
 */
@Entity
@Table(name = "Producto", catalog = "trade", schema = "")
@NamedQueries({@NamedQuery(name = "Producto.findAll"
, query = "SELECT p FROM Producto p"), @NamedQuery(name = "Producto.findByIdProducto"
        , query = "SELECT p FROM Producto p WHERE p.idProducto = :idProducto")
        , @NamedQuery(name = "Producto.findByNombre", query = "SELECT p FROM Producto p WHERE p.nombre = :nombre")
        , @NamedQuery(name = "Producto.findByPrecioUnitario", query = "SELECT p FROM Producto p WHERE p.precioUnitario = :precioUnitario")
        , @NamedQuery(name = "Producto.findByCostoUnitario", query = "SELECT p FROM Producto p WHERE p.costoUnitario = :costoUnitario")
        , @NamedQuery(name = "Producto.findByTipoRegistro", query = "SELECT p FROM Producto p WHERE p.tipoRegistro = :tipoRegistro")
        , @NamedQuery(name = "Producto.findByTipoProducto", query = "SELECT p FROM Producto p WHERE p.tipoProducto = :tipoProducto")
        , @NamedQuery(name = "Producto.findByContenido", query = "SELECT p FROM Producto p WHERE p.contenido = :contenido")
        , @NamedQuery(name = "Producto.findByTipoContenido", query = "SELECT p FROM Producto p WHERE p.tipoContenido = :tipoContenido")
        , @NamedQuery(name = "Producto.findByMarca", query = "SELECT p FROM Producto p WHERE p.marca = :marca")
        , @NamedQuery(name = "Producto.findByFechaActualizacion", query = "SELECT p FROM Producto p WHERE p.fechaActualizacion = :fechaActualizacion")
        , @NamedQuery(name = "Producto.findByFechaModificacion", query = "SELECT p FROM Producto p WHERE p.fechaModificacion = :fechaModificacion")})
public class Producto implements Serializable {
    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idProducto")
    private String idProducto;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "precioUnitario")
    private double precioUnitario;
    @Basic(optional = false)
    @Column(name = "costoUnitario")
    private double costoUnitario;
    @Basic(optional = false)
    @Column(name = "tipoRegistro")
    private boolean tipoRegistro;
    @Basic(optional = false)
    @Column(name = "tipoProducto")
    private int tipoProducto;
    @Basic(optional = false)
    @Column(name = "contenido")
    private double contenido;
    @Basic(optional = false)
    @Column(name = "tipoContenido")
    private int tipoContenido;
    @Basic(optional = false)
    @Column(name = "marca")
    private String marca;
    @Column(name = "idMarca")
    private String idMarca;
    @Basic(optional = false)
    @Column(name = "fechaActualizacion")
    @Temporal(TemporalType.DATE)
    private Date fechaActualizacion;
    @Basic(optional = false)
    @Column(name = "fechaModificacion")
    @Temporal(TemporalType.DATE)
    private Date fechaModificacion;

    public Producto() {
    }

    public Producto(String idProducto) {
        this.idProducto = idProducto;
    }

    public Producto(String idProducto, String nombre, double precioUnitario, double costoUnitario, boolean tipoRegistro, int tipoProducto, double contenido, int tipoContenido, String marca, Date fechaActualizacion, Date fechaModificacion) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precioUnitario = precioUnitario;
        this.costoUnitario = costoUnitario;
        this.tipoRegistro = tipoRegistro;
        this.tipoProducto = tipoProducto;
        this.contenido = contenido;
        this.tipoContenido = tipoContenido;
        this.marca = marca;
        this.fechaActualizacion = fechaActualizacion;
        this.fechaModificacion = fechaModificacion;
    }

    public String getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(String idProducto) {
        String oldIdProducto = this.idProducto;
        this.idProducto = idProducto;
        changeSupport.firePropertyChange("idProducto", oldIdProducto, idProducto);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        String oldNombre = this.nombre;
        this.nombre = nombre;
        changeSupport.firePropertyChange("nombre", oldNombre, nombre);
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(double precioUnitario) {
        double oldPrecioUnitario = this.precioUnitario;
        this.precioUnitario = precioUnitario;
        changeSupport.firePropertyChange("precioUnitario", oldPrecioUnitario, precioUnitario);
    }

    public double getCostoUnitario() {
        return costoUnitario;
    }

    public void setCostoUnitario(double costoUnitario) {
        double oldCostoUnitario = this.costoUnitario;
        this.costoUnitario = costoUnitario;
        changeSupport.firePropertyChange("costoUnitario", oldCostoUnitario, costoUnitario);
    }

    public boolean getTipoRegistro() {
        return tipoRegistro;
    }

    public void setTipoRegistro(boolean tipoRegistro) {
        boolean oldTipoRegistro = this.tipoRegistro;
        this.tipoRegistro = tipoRegistro;
        changeSupport.firePropertyChange("tipoRegistro", oldTipoRegistro, tipoRegistro);
    }

    public int getTipoProducto() {
        return tipoProducto;
    }

    public void setTipoProducto(int tipoProducto) {
        int oldTipoProducto = this.tipoProducto;
        this.tipoProducto = tipoProducto;
        changeSupport.firePropertyChange("tipoProducto", oldTipoProducto, tipoProducto);
    }

    public double getContenido() {
        return contenido;
    }

    public void setContenido(double contenido) {
        double oldContenido = this.contenido;
        this.contenido = contenido;
        changeSupport.firePropertyChange("contenido", oldContenido, contenido);
    }

    public int getTipoContenido() {
        return tipoContenido;
    }

    public void setTipoContenido(int tipoContenido) {
        int oldTipoContenido = this.tipoContenido;
        this.tipoContenido = tipoContenido;
        changeSupport.firePropertyChange("tipoContenido", oldTipoContenido, tipoContenido);
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        String oldMarca = this.marca;
        this.marca = marca;
        changeSupport.firePropertyChange("marca", oldMarca, marca);
    }

    public Date getFechaActualizacion() {
        return fechaActualizacion;
    }

    public void setFechaActualizacion(Date fechaActualizacion) {
        Date oldFechaActualizacion = this.fechaActualizacion;
        this.fechaActualizacion = fechaActualizacion;
        changeSupport.firePropertyChange("fechaActualizacion", oldFechaActualizacion, fechaActualizacion);
    }

    public Date getFechaModificacion() {
        return fechaModificacion;
    }

    public void setFechaModificacion(Date fechaModificacion) {
        Date oldFechaModificacion = this.fechaModificacion;
        this.fechaModificacion = fechaModificacion;
        changeSupport.firePropertyChange("fechaModificacion", oldFechaModificacion, fechaModificacion);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idProducto != null ? idProducto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Producto)) {
            return false;
        }
        Producto other = (Producto) object;
        if ((this.idProducto == null && other.idProducto != null) || (this.idProducto != null && !this.idProducto.equals(other.idProducto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "desktopapplication1.Producto[idProducto=" + idProducto + "]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }

    /**
     * @return the idMarca
     */
    public String getIdMarca() {
        return idMarca;
    }

    /**
     * @param idMarca the idMarca to set
     */
    public void setIdMarca(String idMarca) {
        this.idMarca = idMarca;
    }

}
