/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * Collector.java
 *
 * Created on 16/09/2009, 04:35:56 PM
 */

package beto;

import desktopapplication1.Conexion;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.jdesktop.application.Action;
import org.jdesktop.application.Task;
import org.jdesktop.application.TaskMonitor;

import java.sql.*;
import javax.sql.*;
import java.sql.ResultSet;
import java.util.Vector;
import javax.naming.*;
import javax.swing.JTextField;

/**
 *
 * @author jaehoo
 */
public class Collector extends javax.swing.JFrame {

    private String arr[]=new String[10];
    private Vector arrx=new Vector();
    private Conexion conex;
    private ResultSet rs;
    private char car;


    /** Creates new form Collector */
    public Collector() {
        initComponents();

        conex= new Conexion();
        //conex.abrirConexion();
        
        try {


            rs=conex.consultar("SELECT idMarca, descripcion from Marca order by idMarca");

            while (rs.next()) {
                arrx.add(rs.getString("idMarca") + "-" + rs.getString("descripcion"));

            }
            jComboBox1.setModel(new javax.swing.DefaultComboBoxModel(arrx));

            rs.close();

            rs=conex.consultar("SELECT idContenido,descripcion FROM TipoContenido order by idContenido");
            arrx= new Vector();
            while (rs.next()) {
                arrx.add(rs.getString("idContenido") + "-" + rs.getString("descripcion"));

            }
            jComboBox2.setModel(new javax.swing.DefaultComboBoxModel(arrx));

            rs.close();
            rs=conex.consultar("SELECT idTipoProducto,descripcion FROM TipoProducto order by idTipoProducto");
            arrx= new Vector();
            while (rs.next()) {
                arrx.add(rs.getString("idTipoProducto") + "-" + rs.getString("descripcion"));

            }
            jComboBox3.setModel(new javax.swing.DefaultComboBoxModel(arrx));

            rs.close();



        } catch (SQLException ex) {
            Logger.getLogger(Collector.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            conex.cerrarConexion();
        }

        this.setLocationRelativeTo(null);

    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLayeredPane1 = new javax.swing.JLayeredPane();
        jLayeredPane2 = new javax.swing.JLayeredPane();
        tipoProductoLabel = new javax.swing.JLabel();
        tipoContenidoLabel = new javax.swing.JLabel();
        contenidoLabel = new javax.swing.JLabel();
        fechaModificacionField = new javax.swing.JTextField();
        fechaModificacionLabel = new javax.swing.JLabel();
        fechaActualizacionField = new javax.swing.JTextField();
        fechaActualizacionLabel = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox();
        jComboBox2 = new javax.swing.JComboBox();
        jComboBox3 = new javax.swing.JComboBox();
        botonTipoRegistro = new javax.swing.JToggleButton();
        precioUnitarioField = new javax.swing.JTextField();
        costoUnitarioField = new javax.swing.JTextField();
        tipoRegistroField = new javax.swing.JTextField();
        tipoRegistroLabel = new javax.swing.JLabel();
        precioUnitarioLabel = new javax.swing.JLabel();
        costoUnitarioLabel = new javax.swing.JLabel();
        nombreField = new javax.swing.JTextField();
        idProductoField = new javax.swing.JTextField();
        idProductoLabel = new javax.swing.JLabel();
        nombreLabel = new javax.swing.JLabel();
        marcaLabel = new javax.swing.JLabel();
        contenidoField = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        newButton = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLayeredPane1.setName("jLayeredPane1"); // NOI18N

        jLayeredPane2.setName("jLayeredPane2"); // NOI18N

        org.jdesktop.application.ResourceMap resourceMap = org.jdesktop.application.Application.getInstance(desktopapplication1.DesktopApplication1.class).getContext().getResourceMap(Collector.class);
        tipoProductoLabel.setText(resourceMap.getString("tipoProductoLabel.text")); // NOI18N
        tipoProductoLabel.setName("tipoProductoLabel"); // NOI18N
        tipoProductoLabel.setBounds(20, 160, 91, 17);
        jLayeredPane2.add(tipoProductoLabel, javax.swing.JLayeredPane.DEFAULT_LAYER);

        tipoContenidoLabel.setText(resourceMap.getString("tipoContenidoLabel.text")); // NOI18N
        tipoContenidoLabel.setName("tipoContenidoLabel"); // NOI18N
        tipoContenidoLabel.setBounds(20, 130, 99, 17);
        jLayeredPane2.add(tipoContenidoLabel, javax.swing.JLayeredPane.DEFAULT_LAYER);

        contenidoLabel.setText(resourceMap.getString("contenidoLabel.text")); // NOI18N
        contenidoLabel.setName("contenidoLabel"); // NOI18N
        contenidoLabel.setBounds(430, 110, 69, 17);
        jLayeredPane2.add(contenidoLabel, javax.swing.JLayeredPane.DEFAULT_LAYER);

        fechaModificacionField.setName("fechaModificacionField"); // NOI18N
        fechaModificacionField.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                fechaModificacionFieldFocusGained(evt);
            }
        });
        fechaModificacionField.setBounds(160, 230, 141, 25);
        jLayeredPane2.add(fechaModificacionField, javax.swing.JLayeredPane.DEFAULT_LAYER);

        fechaModificacionLabel.setText(resourceMap.getString("fechaModificacionLabel.text")); // NOI18N
        fechaModificacionLabel.setName("fechaModificacionLabel"); // NOI18N
        fechaModificacionLabel.setBounds(20, 230, 124, 17);
        jLayeredPane2.add(fechaModificacionLabel, javax.swing.JLayeredPane.DEFAULT_LAYER);

        fechaActualizacionField.setName("fechaActualizacionField"); // NOI18N
        fechaActualizacionField.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                fechaActualizacionFieldFocusGained(evt);
            }
        });
        fechaActualizacionField.setBounds(160, 200, 140, 25);
        jLayeredPane2.add(fechaActualizacionField, javax.swing.JLayeredPane.DEFAULT_LAYER);

        fechaActualizacionLabel.setText(resourceMap.getString("fechaActualizacionLabel.text")); // NOI18N
        fechaActualizacionLabel.setName("fechaActualizacionLabel"); // NOI18N
        fechaActualizacionLabel.setBounds(20, 200, 130, 17);
        jLayeredPane2.add(fechaActualizacionLabel, javax.swing.JLayeredPane.DEFAULT_LAYER);

        jComboBox1.setEditable(true);
        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        jComboBox1.setName("jComboBox1"); // NOI18N
        jComboBox1.setNextFocusableComponent(contenidoField);
        jComboBox1.setBounds(80, 80, 160, 20);
        jLayeredPane2.add(jComboBox1, javax.swing.JLayeredPane.DEFAULT_LAYER);

        jComboBox2.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        jComboBox2.setName("jComboBox2"); // NOI18N
        jComboBox2.setNextFocusableComponent(jComboBox3);
        jComboBox2.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                jComboBox2FocusLost(evt);
            }
        });
        jComboBox2.setBounds(130, 130, 190, 20);
        jLayeredPane2.add(jComboBox2, javax.swing.JLayeredPane.DEFAULT_LAYER);

        jComboBox3.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        jComboBox3.setName("jComboBox3"); // NOI18N
        jComboBox3.setBounds(130, 160, 190, 20);
        jLayeredPane2.add(jComboBox3, javax.swing.JLayeredPane.DEFAULT_LAYER);

        botonTipoRegistro.setMnemonic('R');
        botonTipoRegistro.setText(resourceMap.getString("botonTipoRegistro.text")); // NOI18N
        botonTipoRegistro.setName("botonTipoRegistro"); // NOI18N
        botonTipoRegistro.setNextFocusableComponent(precioUnitarioField);
        botonTipoRegistro.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                botonTipoRegistroActionPerformed(evt);
            }
        });
        botonTipoRegistro.setBounds(520, 10, 130, 25);
        jLayeredPane2.add(botonTipoRegistro, javax.swing.JLayeredPane.DEFAULT_LAYER);

        precioUnitarioField.setName("precioUnitarioField"); // NOI18N
        precioUnitarioField.setNextFocusableComponent(jComboBox1);
        precioUnitarioField.addCaretListener(new javax.swing.event.CaretListener() {
            public void caretUpdate(javax.swing.event.CaretEvent evt) {
                precioUnitarioFieldCaretUpdate(evt);
            }
        });
        precioUnitarioField.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                precioUnitarioFieldFocusGained(evt);
            }
        });
        precioUnitarioField.setBounds(530, 50, 102, 25);
        jLayeredPane2.add(precioUnitarioField, javax.swing.JLayeredPane.DEFAULT_LAYER);

        costoUnitarioField.setText(resourceMap.getString("costoUnitarioField.text")); // NOI18N
        costoUnitarioField.setName("costoUnitarioField"); // NOI18N
        costoUnitarioField.addCaretListener(new javax.swing.event.CaretListener() {
            public void caretUpdate(javax.swing.event.CaretEvent evt) {
                costoUnitarioFieldCaretUpdate(evt);
            }
        });
        costoUnitarioField.setBounds(530, 80, 102, 25);
        jLayeredPane2.add(costoUnitarioField, javax.swing.JLayeredPane.DEFAULT_LAYER);

        tipoRegistroField.setEditable(false);
        tipoRegistroField.setName("tipoRegistroField"); // NOI18N
        tipoRegistroField.setBounds(460, 10, 52, 25);
        jLayeredPane2.add(tipoRegistroField, javax.swing.JLayeredPane.DEFAULT_LAYER);

        tipoRegistroLabel.setText(resourceMap.getString("tipoRegistroLabel.text")); // NOI18N
        tipoRegistroLabel.setName("tipoRegistroLabel"); // NOI18N
        tipoRegistroLabel.setBounds(350, 10, 86, 17);
        jLayeredPane2.add(tipoRegistroLabel, javax.swing.JLayeredPane.DEFAULT_LAYER);

        precioUnitarioLabel.setText(resourceMap.getString("precioUnitarioLabel.text")); // NOI18N
        precioUnitarioLabel.setName("precioUnitarioLabel"); // NOI18N
        precioUnitarioLabel.setBounds(430, 50, 97, 17);
        jLayeredPane2.add(precioUnitarioLabel, javax.swing.JLayeredPane.DEFAULT_LAYER);

        costoUnitarioLabel.setText(resourceMap.getString("costoUnitarioLabel.text")); // NOI18N
        costoUnitarioLabel.setName("costoUnitarioLabel"); // NOI18N
        costoUnitarioLabel.setBounds(430, 80, 95, 17);
        jLayeredPane2.add(costoUnitarioLabel, javax.swing.JLayeredPane.DEFAULT_LAYER);

        nombreField.setName("nombreField"); // NOI18N
        nombreField.setNextFocusableComponent(botonTipoRegistro);
        nombreField.addCaretListener(new javax.swing.event.CaretListener() {
            public void caretUpdate(javax.swing.event.CaretEvent evt) {
                nombreFieldCaretUpdate(evt);
            }
        });
        nombreField.setBounds(120, 40, 125, 25);
        jLayeredPane2.add(nombreField, javax.swing.JLayeredPane.DEFAULT_LAYER);

        idProductoField.setName("idProductoField"); // NOI18N
        idProductoField.setNextFocusableComponent(nombreField);
        idProductoField.addCaretListener(new javax.swing.event.CaretListener() {
            public void caretUpdate(javax.swing.event.CaretEvent evt) {
                idProductoFieldCaretUpdate(evt);
            }
        });
        idProductoField.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                idProductoFieldKeyPressed(evt);
            }
        });
        idProductoField.setBounds(120, 10, 125, 25);
        jLayeredPane2.add(idProductoField, javax.swing.JLayeredPane.DEFAULT_LAYER);

        idProductoLabel.setText(resourceMap.getString("idProductoLabel.text")); // NOI18N
        idProductoLabel.setName("idProductoLabel"); // NOI18N
        idProductoLabel.setBounds(20, 10, 76, 17);
        jLayeredPane2.add(idProductoLabel, javax.swing.JLayeredPane.DEFAULT_LAYER);

        nombreLabel.setText(resourceMap.getString("nombreLabel.text")); // NOI18N
        nombreLabel.setName("nombreLabel"); // NOI18N
        nombreLabel.setBounds(20, 40, 56, 17);
        jLayeredPane2.add(nombreLabel, javax.swing.JLayeredPane.DEFAULT_LAYER);

        marcaLabel.setText(resourceMap.getString("marcaLabel.text")); // NOI18N
        marcaLabel.setName("marcaLabel"); // NOI18N
        marcaLabel.setBounds(20, 80, 43, 17);
        jLayeredPane2.add(marcaLabel, javax.swing.JLayeredPane.DEFAULT_LAYER);

        contenidoField.setName("contenidoField"); // NOI18N
        contenidoField.setNextFocusableComponent(jComboBox2);
        contenidoField.addCaretListener(new javax.swing.event.CaretListener() {
            public void caretUpdate(javax.swing.event.CaretEvent evt) {
                contenidoFieldCaretUpdate(evt);
            }
        });
        contenidoField.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                contenidoFieldFocusGained(evt);
            }
        });
        contenidoField.setBounds(530, 110, 51, 25);
        jLayeredPane2.add(contenidoField, javax.swing.JLayeredPane.DEFAULT_LAYER);

        javax.swing.ActionMap actionMap = org.jdesktop.application.Application.getInstance(desktopapplication1.DesktopApplication1.class).getContext().getActionMap(Collector.class, this);
        jButton1.setAction(actionMap.get("NuevaMarca")); // NOI18N
        jButton1.setText(resourceMap.getString("jButton1.text")); // NOI18N
        jButton1.setName("jButton1"); // NOI18N
        jButton1.setBounds(250, 80, 60, 20);
        jLayeredPane2.add(jButton1, javax.swing.JLayeredPane.DEFAULT_LAYER);

        jButton2.setAction(actionMap.get("borrarMarca")); // NOI18N
        jButton2.setText(resourceMap.getString("jButton2.text")); // NOI18N
        jButton2.setName("jButton2"); // NOI18N
        jButton2.setBounds(320, 80, 70, 20);
        jLayeredPane2.add(jButton2, javax.swing.JLayeredPane.DEFAULT_LAYER);

        jButton3.setMnemonic('S');
        jButton3.setText(resourceMap.getString("jButton3.text")); // NOI18N
        jButton3.setName("jButton3"); // NOI18N
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        jButton3.setBounds(490, 270, 120, 25);
        jLayeredPane2.add(jButton3, javax.swing.JLayeredPane.DEFAULT_LAYER);

        newButton.setAction(actionMap.get("AccionAlgo")); // NOI18N
        newButton.setMnemonic('g');
        newButton.setText(resourceMap.getString("newButton.text")); // NOI18N
        newButton.setName("newButton"); // NOI18N
        newButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                newButtonActionPerformed(evt);
            }
        });
        newButton.setBounds(360, 270, 100, 25);
        jLayeredPane2.add(newButton, javax.swing.JLayeredPane.DEFAULT_LAYER);

        jButton4.setMnemonic('b');
        jButton4.setText(resourceMap.getString("jButton4.text")); // NOI18N
        jButton4.setName("jButton4"); // NOI18N
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });
        jButton4.setBounds(260, 10, 80, 25);
        jLayeredPane2.add(jButton4, javax.swing.JLayeredPane.DEFAULT_LAYER);

        jButton5.setMnemonic('l');
        jButton5.setText(resourceMap.getString("jButton5.text")); // NOI18N
        jButton5.setName("jButton5"); // NOI18N
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });
        jButton5.setBounds(230, 270, 120, 25);
        jLayeredPane2.add(jButton5, javax.swing.JLayeredPane.DEFAULT_LAYER);

        jLabel1.setFont(resourceMap.getFont("jLabel1.font")); // NOI18N
        jLabel1.setForeground(resourceMap.getColor("jLabel1.foreground")); // NOI18N
        jLabel1.setText(resourceMap.getString("jLabel1.text")); // NOI18N
        jLabel1.setName("jLabel1"); // NOI18N
        jLabel1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel1MouseClicked(evt);
            }
        });
        jLabel1.setBounds(390, 200, 190, 40);
        jLayeredPane2.add(jLabel1, javax.swing.JLayeredPane.DEFAULT_LAYER);

        jLayeredPane2.setBounds(0, 0, 660, 310);
        jLayeredPane1.add(jLayeredPane2, javax.swing.JLayeredPane.DEFAULT_LAYER);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLayeredPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 661, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLayeredPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 309, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void newButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_newButtonActionPerformed

}//GEN-LAST:event_newButtonActionPerformed

    private void botonTipoRegistroActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_botonTipoRegistroActionPerformed


        if(botonTipoRegistro.isSelected()){
            botonTipoRegistro.setText("Registrable");

        } else{
            botonTipoRegistro.setText("NO Registrable");

        }
        tipoRegistroField.setText(botonTipoRegistro.isSelected()+"");

        validaBotonGuardar();
        

    }//GEN-LAST:event_botonTipoRegistroActionPerformed

    private void precioUnitarioFieldFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_precioUnitarioFieldFocusGained
        precioUnitarioField.setText(null);
}//GEN-LAST:event_precioUnitarioFieldFocusGained

    private void contenidoFieldFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_contenidoFieldFocusGained
        contenidoField.setText(null);        // TODO add your handling code here:
}//GEN-LAST:event_contenidoFieldFocusGained

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed

        System.exit(0);

    }//GEN-LAST:event_jButton3ActionPerformed

    private void idProductoFieldCaretUpdate(javax.swing.event.CaretEvent evt) {//GEN-FIRST:event_idProductoFieldCaretUpdate
        validaBotonGuardar();
    }//GEN-LAST:event_idProductoFieldCaretUpdate

    private void nombreFieldCaretUpdate(javax.swing.event.CaretEvent evt) {//GEN-FIRST:event_nombreFieldCaretUpdate
        validaBotonGuardar();
    }//GEN-LAST:event_nombreFieldCaretUpdate

    private void precioUnitarioFieldCaretUpdate(javax.swing.event.CaretEvent evt) {//GEN-FIRST:event_precioUnitarioFieldCaretUpdate
        validaBotonGuardar();
    }//GEN-LAST:event_precioUnitarioFieldCaretUpdate

    private void costoUnitarioFieldCaretUpdate(javax.swing.event.CaretEvent evt) {//GEN-FIRST:event_costoUnitarioFieldCaretUpdate
                validaBotonGuardar();

    }//GEN-LAST:event_costoUnitarioFieldCaretUpdate

    private void contenidoFieldCaretUpdate(javax.swing.event.CaretEvent evt) {//GEN-FIRST:event_contenidoFieldCaretUpdate
                validaBotonGuardar();

    }//GEN-LAST:event_contenidoFieldCaretUpdate

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
    buscar();




    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
limpiacampos();
idProductoField.requestFocus();
idProductoField.setText("");
    }//GEN-LAST:event_jButton5ActionPerformed

    private void idProductoFieldKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_idProductoFieldKeyPressed
    if(evt.getKeyCode()==10){
        System.out.println("OK");
        buscar();
    }
    }//GEN-LAST:event_idProductoFieldKeyPressed

    private void jLabel1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel1MouseClicked
        idProductoField.setText(jLabel1.getText());
    }//GEN-LAST:event_jLabel1MouseClicked

    private void jComboBox2FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_jComboBox2FocusLost
validaBotonGuardar();        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBox2FocusLost

    private void fechaActualizacionFieldFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_fechaActualizacionFieldFocusGained
validaBotonGuardar();        // TODO add your handling code here:
    }//GEN-LAST:event_fechaActualizacionFieldFocusGained

    private void fechaModificacionFieldFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_fechaModificacionFieldFocusGained
validaBotonGuardar();        // TODO add your handling code here:
    }//GEN-LAST:event_fechaModificacionFieldFocusGained

    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Collector().setVisible(true);
            }
        });
    }

    @Action
    public Task AccionAlgo() {
        return new AccionAlgoTask(org.jdesktop.application.Application.getInstance(desktopapplication1.DesktopApplication1.class));
    }

    private class AccionAlgoTask extends org.jdesktop.application.Task<Object, Void> {
        AccionAlgoTask(org.jdesktop.application.Application app) {
            // Runs on the EDT.  Copy GUI state that
            // doInBackground() depends on from parameters
            // to AccionAlgoTask fields, here.
            super(app);
        }
        @Override protected Object doInBackground() {

            conex= new Conexion();

            int i=0;
String okquery="insert into Producto(idProducto,nombre,precioUnitario,costoUnitario,tipoRegistro,tipoProducto,contenido,tipoContenido,idMarca)"
                    +"values('"
                    +idProductoField.getText()+"','"
                    +nombreField.getText()+"',"
                    +precioUnitarioField.getText()+","
                    +costoUnitarioField.getText()+","
                    +tipoRegistroField.getText()+","
                    +jComboBox3.getSelectedItem().toString().substring(0,jComboBox3.getSelectedItem().toString().indexOf("-"))+","
                    +contenidoField.getText()+","
                    +jComboBox2.getSelectedItem().toString().substring(0,jComboBox2.getSelectedItem().toString().indexOf("-"))+","
                    +jComboBox1.getSelectedItem().toString().substring(0,jComboBox1.getSelectedItem().toString().indexOf("-"))+");";


            i=conex.actualizar(okquery);
                    System.out.println("Registros afectados: "+i);

            
        conex.cerrarConexion();

        System.out.println("EjecutaX");
        idProductoField.requestFocus();

        botonTipoRegistro.setSelected(false);
        botonTipoRegistro.setText("NO Registrable");

        limpiacampos();
        tipoRegistroField.setText("false");
        jComboBox1.setSelectedIndex(-1);
        jComboBox2.setSelectedIndex(-1);
        jComboBox3.setSelectedIndex(-1);

        idProductoField.setText("");
        newButton.setEnabled(false);

            return null;  // return your result
        }
        @Override protected void succeeded(Object result) {
            // Runs on the EDT.  Update the GUI based on
            // the result computed by doInBackground().
        }
    }

    @Action
    public void NuevaMarca() {

        conex= new Conexion();

        int i=0;
        i=conex.actualizar("INSERT INTO Marca (idMarca,descripcion) VALUES((SELECT MAX(x.idMarca)+1 FROM Marca x),'"+jComboBox1.getSelectedItem().toString()+"');");
        System.out.println("Registros afectados: "+i);


        arrx= new Vector();
         rs=conex.consultar("SELECT idMarca, descripcion from Marca order by idMarca");
        try {
            while (rs.next()) {
                arrx.add(rs.getString("idMarca") + "-" + rs.getString("descripcion"));
            }

            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(Collector.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel(arrx));
        jComboBox1.setSelectedIndex(-1);
        conex.cerrarConexion();

    }

    @Action
    public void borrarMarca() {


        if(!jComboBox1.getSelectedItem().toString().equals("")){


        System.out.println(
                jComboBox1.getSelectedItem().toString().substring(0,jComboBox1.getSelectedItem().toString().indexOf("-") ));


        conex= new Conexion();

        int i=0;
        i=conex.actualizar("delete from Marca where idMarca in ("
                +jComboBox1.getSelectedItem().toString().substring(0,
                jComboBox1.getSelectedItem().toString().indexOf("-") )
                +");");
        System.out.println("Registros afectados: "+i);


         arrx= new Vector();
         rs=conex.consultar("SELECT idMarca, descripcion from Marca order by idMarca");
        try {
            while (rs.next()) {
                arrx.add(rs.getString("idMarca") + "-" + rs.getString("descripcion"));
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(Collector.class.getName()).log(Level.SEVERE, null, ex);
        }

         jComboBox1.setModel(new javax.swing.DefaultComboBoxModel(arrx));
        jComboBox1.setSelectedIndex(-1);
         conex.cerrarConexion();
        }
        
    }


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JToggleButton botonTipoRegistro;
    private javax.swing.JTextField contenidoField;
    private javax.swing.JLabel contenidoLabel;
    private javax.swing.JTextField costoUnitarioField;
    private javax.swing.JLabel costoUnitarioLabel;
    private javax.swing.JTextField fechaActualizacionField;
    private javax.swing.JLabel fechaActualizacionLabel;
    private javax.swing.JTextField fechaModificacionField;
    private javax.swing.JLabel fechaModificacionLabel;
    private javax.swing.JTextField idProductoField;
    private javax.swing.JLabel idProductoLabel;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JComboBox jComboBox1;
    private javax.swing.JComboBox jComboBox2;
    private javax.swing.JComboBox jComboBox3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLayeredPane jLayeredPane1;
    private javax.swing.JLayeredPane jLayeredPane2;
    private javax.swing.JLabel marcaLabel;
    private javax.swing.JButton newButton;
    private javax.swing.JTextField nombreField;
    private javax.swing.JLabel nombreLabel;
    private javax.swing.JTextField precioUnitarioField;
    private javax.swing.JLabel precioUnitarioLabel;
    private javax.swing.JLabel tipoContenidoLabel;
    private javax.swing.JLabel tipoProductoLabel;
    private javax.swing.JTextField tipoRegistroField;
    private javax.swing.JLabel tipoRegistroLabel;
    // End of variables declaration//GEN-END:variables

    public void validaBotonGuardar(){
        if(idProductoField.getText().length()>0
            && idProductoField.getText()!=null
            && nombreField.getText().length()>0
            && nombreField.getText()!=null
            && tipoRegistroField.getText().length()>0
            && tipoRegistroField.getText()!=null
            && precioUnitarioField.getText().length()>0
            && precioUnitarioField.getText()!=null
            && costoUnitarioField.getText().length()>0
            && costoUnitarioField.getText()!=null
            && contenidoField.getText().length()>0
            && contenidoField.getText()!=null
            && jComboBox1.getSelectedIndex()!=-1
            && jComboBox2.getSelectedIndex()!=-1
            && jComboBox3.getSelectedIndex()!=-1
            ){
            newButton.setEnabled(true);

        }
        else{
            newButton.setEnabled(false);
        }


    }

    public void limpiacampos(){

   // idProductoField.setText("");
    nombreField.setText("");
    tipoRegistroField.setText("");
    precioUnitarioField.setText("");
    costoUnitarioField.setText("0");
    contenidoField.setText("");
    jComboBox1.setSelectedIndex(-1);
    jComboBox2.setSelectedIndex(-1);
    jComboBox3.setSelectedIndex(-1);
    jLabel1.setText("-------------");
    }

    public void buscar(){

        if(idProductoField.getText().length()>0 && idProductoField.getText()!=null){

        conex= new Conexion();

        rs=conex.consultar("SELECT P.idProducto,P.nombre,P.precioUnitario,P.costoUnitario,P.tipoRegistro" +
                ",P.tipoProducto,P.contenido,P.tipoContenido,P.idMarca,M.descripcion, tp.descripcion,tc.descripcion" +
                " FROM Producto P,Marca M, TipoContenido tc, TipoProducto tp" +
                " where P.idProducto="+idProductoField.getText()
                +" and P.idMarca=M.idMarca and P.tipoProducto=tp.idTipoProducto and P.tipoContenido=tc.idContenido;"
                );

        try {
            if(rs.next()) {

                /*SELECT
                idProducto,nombre,precioUnitario,
                 costoUnitario,tipoRegistro,
                 tipoProducto
                 ,contenido,tipoContenido
                 ,idMarca FROM Producto P */

                idProductoField.setText("");
                nombreField.setText(rs.getString("nombre"));
                precioUnitarioField.setText(rs.getString("precioUnitario"));
                tipoRegistroField.setText(rs.getBoolean("tipoRegistro")+"");
                contenidoField.setText(rs.getString("contenido"));

                jComboBox1.setSelectedItem(rs.getString("idMarca")+"-"+rs.getString("M.descripcion"));
                jComboBox2.setSelectedItem(rs.getString("TipoContenido")+"-"+rs.getString("tc.descripcion"));
                jComboBox3.setSelectedItem(rs.getString("tipoProducto")+"-"+rs.getString("tp.descripcion"));





                jLabel1.setText(rs.getString("idProducto"));



            }
            else{

                limpiacampos();
            }

//            if(!jLabel1.getText().equals("-------------")){
//                idProductoField.setText(jLabel1.getText());
//                idProductoField.setText("");
//            }else{
//                jLabel1.setText("-------------");
//            }

            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(Collector.class.getName()).log(Level.SEVERE, null, ex);
        }

        conex.cerrarConexion();
        }




    }
}
