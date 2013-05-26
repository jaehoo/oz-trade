/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package beto;

import java.awt.BorderLayout;
import javax.swing.JPanel;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JComboBox;
import javax.swing.JButton;
import java.awt.Dimension;
import javax.swing.JTextArea;

import java.awt.Rectangle;
import java.awt.Font;

public class RegistraProductos extends JFrame {

 private JPanel jContentPane = null;
 private JLabel jLabel = null;
 private JLabel jLabel1 = null;
 private JLabel jLabel2 = null;
 private JLabel jLabel3 = null;
 private JLabel jLabel4 = null;
 private JTextField jTextField = null;
 private JTextField jTextField1 = null;
 private JComboBox jComboBox = null;
 private JComboBox jComboBox1 = null;
 private JButton jButton = null;
 private JButton jButton1 = null;
 private JButton jButton2 = null;
 private JButton jButton3 = null;
 private JLabel jLabel5 = null;
 private JComboBox jComboBox2 = null;
 private JTextArea jTextArea = null;
 private JLabel jLabel11 = null;
 private JLabel jLabel21 = null;
 private JLabel jLabel31 = null;
 private JLabel jLabel41 = null;


 // declaracion de variables globales
 Producto x[] = new Producto[10];

 int indice = 0;

 int y = 1;
 public RegistraProductos() {
  super();
  initialize();
 }

 private void initialize() {
  this.setSize(450, 370);
  this.setContentPane(getJContentPane());
  this.setTitle("JFrame");


  // llenado de los jcombobox
  jComboBox.addItem("<Escoja>");
  jComboBox.addItem("Lacteos");
  jComboBox.addItem("Carnes");
  jComboBox.addItem("Arroz");

  jComboBox2.addItem("<Escoja>");
  jComboBox2.addItem("Lacteos");
  jComboBox2.addItem("Carnes");
  jComboBox2.addItem("Arroz");

  jTextField.setText(String.valueOf(y));
 }

 private JPanel getJContentPane() {
  if (jContentPane == null) {
   jLabel41 = new JLabel();
   jLabel41.setBounds(new Rectangle(323, 178, 54, 12));
   jLabel41.setText("Precio");
   jLabel31 = new JLabel();
   jLabel31.setBounds(new Rectangle(235, 177, 63, 12));
   jLabel31.setText("Nombre");
   jLabel21 = new JLabel();
   jLabel21.setBounds(new Rectangle(147, 176, 68, 16));
   jLabel21.setText("Categoria");
   jLabel11 = new JLabel();
   jLabel11.setBounds(new Rectangle(71, 175, 52, 15));
   jLabel11.setText("Codigo");
   jLabel5 = new JLabel();
   jLabel5.setBounds(new java.awt.Rectangle(212, 121, 50, 16));
   jLabel5.setText("Buscar");
   jLabel4 = new JLabel();
   jLabel4.setBounds(new java.awt.Rectangle(15, 140, 66, 16));
   jLabel4.setText("Precio");
   jLabel3 = new JLabel();
   jLabel3.setBounds(new java.awt.Rectangle(15, 111, 65, 16));
   jLabel3.setText("Nombre");
   jLabel2 = new JLabel();
   jLabel2.setBounds(new java.awt.Rectangle(17, 82, 62, 16));
   jLabel2.setText("Categoria");
   jLabel1 = new JLabel();
   jLabel1.setBounds(new java.awt.Rectangle(14, 50, 66, 16));
   jLabel1.setText("Codigo");
   jLabel = new JLabel();
   jLabel.setBounds(new java.awt.Rectangle(124, 13, 158, 16));
   jLabel.setText("REGISTRO DE PRODUCTOS");
   jContentPane = new JPanel();
   jContentPane.setLayout(null);
   jContentPane.add(jLabel, null);
   jContentPane.add(jLabel1, null);
   jContentPane.add(jLabel2, null);
   jContentPane.add(jLabel3, null);
   jContentPane.add(jLabel4, null);
   jContentPane.add(getJTextField(), null);
   jContentPane.add(getJTextField1(), null);
   jContentPane.add(getJComboBox(), null);
   jContentPane.add(getJComboBox1(), null);
   jContentPane.add(getJButton(), null);
   jContentPane.add(getJButton1(), null);
   jContentPane.add(getJButton2(), null);
   jContentPane.add(getJButton3(), null);
   jContentPane.add(jLabel5, null);
   jContentPane.add(getJComboBox2(), null);
   jContentPane.add(getJTextArea(), null);
   jContentPane.add(jLabel11, null);
   jContentPane.add(jLabel21, null);
   jContentPane.add(jLabel31, null);
   jContentPane.add(jLabel41, null);
  }
  return jContentPane;
 }

 private JTextField getJTextField() {
  if (jTextField == null) {
   jTextField = new JTextField();
   jTextField.setBounds(new java.awt.Rectangle(93, 48, 93, 20));
   jTextField.setFont(new Font("Dialog", Font.PLAIN, 12));
  }
  return jTextField;
 }

 private JTextField getJTextField1() {
  if (jTextField1 == null) {
   jTextField1 = new JTextField();
   jTextField1.setBounds(new java.awt.Rectangle(91, 134, 94, 20));
  }
  return jTextField1;
 }

 private JComboBox getJComboBox() {
  if (jComboBox == null) {
   jComboBox = new JComboBox();
   jComboBox.setBounds(new java.awt.Rectangle(92, 75, 94, 25));
   jComboBox.addItemListener(new java.awt.event.ItemListener() {
    public void itemStateChanged(java.awt.event.ItemEvent e) {
     // System.out.println("itemStateChanged()"); // TODO
     // Auto-generated Event stub itemStateChanged()


     int ind = jComboBox.getSelectedIndex();
     jComboBox1.removeAllItems();
     jComboBox1.addItem("<Escoja>");
     if (ind == 1) {
      jComboBox1.addItem("Leche");
      jComboBox1.addItem("Yogurt");
      jComboBox1.addItem("Queso");
     }
     if (ind == 2) {
      jComboBox1.addItem("Res");
      jComboBox1.addItem("Cerdo");
      jComboBox1.addItem("Pollo");
     }
     if (ind == 3) {
      jComboBox1.addItem("Extra");
      jComboBox1.addItem("Superior");
     }
    }

   });
  }
  return jComboBox;
 }

 private JComboBox getJComboBox1() {
  if (jComboBox1 == null) {
   jComboBox1 = new JComboBox();
   jComboBox1.setBounds(new java.awt.Rectangle(92, 105, 94, 25));
   jComboBox1.addItemListener(new java.awt.event.ItemListener() {
    public void itemStateChanged(java.awt.event.ItemEvent e) {
     // System.out.println("itemStateChanged()"); // TODO
     // Auto-generated Event stub itemStateChanged()


     double pre = 0;
     int ind = jComboBox.getSelectedIndex();
     int ind1 = jComboBox1.getSelectedIndex();
     if (ind == 1) {
      if (ind1 == 1)
       pre = 2.20;
      if (ind1 == 2)
       pre = 3.50;
      if (ind1 == 3)
       pre = 5.50;
     }
     if (ind == 2) {
      if (ind1 == 1)
       pre = 12.00;
      if (ind1 == 2)
       pre = 9.00;
      if (ind1 == 3)
       pre = 6.00;
     }
     if (ind == 3) {
      if (ind1 == 1)
       pre = 3.00;
      if (ind1 == 2)
       pre = 2.50;
     }

     jTextField1.setText(String.valueOf(pre));
    }
   });
  }
  return jComboBox1;
 }


 private JButton getJButton() {
  if (jButton == null) {
   jButton = new JButton();
   jButton.setBounds(new java.awt.Rectangle(207, 48, 97, 17));
   jButton.setText("Nuevo");
   jButton.addActionListener(new java.awt.event.ActionListener() {
    public void actionPerformed(java.awt.event.ActionEvent e) {
     // System.out.println("actionPerformed()"); // TODO
     // Auto-generated Event stub actionPerformed()

     y++;
     jTextField.setText(String.valueOf(y));
     jTextField1.setText("");
     jComboBox.setSelectedIndex(0);
     jComboBox1.setSelectedIndex(0);
     jComboBox2.setSelectedIndex(0);
     jTextArea.setText("");
     jTextField.requestFocus();
    }
   });
  }
  return jButton;
 }

 private JButton getJButton1() {
  if (jButton1 == null) {
   jButton1 = new JButton();
   jButton1.setBounds(new java.awt.Rectangle(208, 68, 98, 18));
   jButton1.setText("Registrar");
   jButton1.addActionListener(new java.awt.event.ActionListener() {
    public void actionPerformed(java.awt.event.ActionEvent e) {
     // System.out.println("actionPerformed()"); // TODO
     // Auto-generated Event stub actionPerformed()

     int c = Integer.parseInt(jTextField.getText());
     String cat = String.valueOf(jComboBox.getSelectedItem());
     String n = String.valueOf(jComboBox1.getSelectedItem());
     double p = Double.parseDouble(jTextField1.getText());

     Producto prod = new Producto(c, cat, n, p);
     // almaceno el objeto en el arreglo
     x[indice] = prod;
     indice++;
     jTextArea.setText("Producto Registrado");
    }
   });
  }
  return jButton1;
 }

 private JButton getJButton2() {
  if (jButton2 == null) {
   jButton2 = new JButton();
   jButton2.setBounds(new java.awt.Rectangle(210, 90, 97, 19));
   jButton2.setText("Imprimir");
   jButton2.addActionListener(new java.awt.event.ActionListener() {
    public void actionPerformed(java.awt.event.ActionEvent e) {
     // System.out.println("actionPerformed()"); // TODO
     // Auto-generated Event stub actionPerformed()

     jTextArea.setText("");
     Producto pro = new Producto();
     for (int i = 0; i < indice; i++) {
      for (int j = i + 1; j < indice; j++) {
       int com = x[i].nombre.compareTo(x[j].nombre);
       if (com > 0) {
        pro = x[i];
        x[i] = x[j];
        x[j] = pro;
       }
      }
      jTextArea.append(x[i].codigo + "\t" + x[i].categoria
        + "\t" + x[i].nombre + "\t" + x[i].precio
        + "\n");
     }
    }
   });
  }
  return jButton2;
 }

 private JButton getJButton3() {
  if (jButton3 == null) {
   jButton3 = new JButton();
   jButton3.setBounds(new java.awt.Rectangle(316, 47, 96, 19));
   jButton3.setText("Salir");
   jButton3.addActionListener(new java.awt.event.ActionListener() {
    public void actionPerformed(java.awt.event.ActionEvent e) {
     // System.out.println("actionPerformed()"); // TODO
     // Auto-generated Event stub actionPerformed()

     System.exit(0);
    }
   });
  }
  return jButton3;
 }

 private JComboBox getJComboBox2() {
  if (jComboBox2 == null) {
   jComboBox2 = new JComboBox();
   jComboBox2.setBounds(new java.awt.Rectangle(211, 144, 96, 20));
   jComboBox2.addItemListener(new java.awt.event.ItemListener() {
    public void itemStateChanged(java.awt.event.ItemEvent e) {
     // System.out.println("itemStateChanged()"); // TODO
     // Auto-generated Event stub itemStateChanged()

     jTextArea.setText("");
     String ind = String.valueOf(jComboBox2.getSelectedItem());
     for (int i = 0; i < indice; i++) {
      if (ind == x[i].categoria) {
       jTextArea.append(x[i].codigo + "\t"
         + x[i].categoria + "\t" + x[i].nombre
         + "\t" + x[i].precio + "\n");
      }
     }

    }
   });
  }
  return jComboBox2;
 }

 private JTextArea getJTextArea() {
  if (jTextArea == null) {
   jTextArea = new JTextArea();
   jTextArea.setBounds(new Rectangle(63, 193, 322, 140));
  }
  return jTextArea;
 }

 class Producto{


     public String nombre;
     public String codigo;
     public String categoria;
     public double precio;

        public Producto() {
        }
        public Producto(int a, String b, String c, double d) {
        }


 }

}