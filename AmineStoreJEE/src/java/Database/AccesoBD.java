package Database;

import Bean.Producto;
import Bean.Contacto;
import Bean.Categoria;
import Bean.Estado_Pedido;
import Bean.Pedido;
import Bean.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AccesoBD {


    private static final String DEFAULT_DATA_BASE_NAME = "aminestore";
    private static final String DEFAULT_DATA_BASE_USER = "root";
    private static final String DEFAULT_DATA_BASE_PASSWORD = "";
    private Connection conexionBD;
    private static final String PRODUCTOS_QUERY = "SELECT * FROM productos";
    private static final String CATEGORIAS_QUERY = "SELECT * FROM categorias";
    private static final String PRODUCTO_ID_QUERY = "SELECT * FROM productos WHERE id=?";
    private static final String USUARIO_LOGIN_QUERY = "SELECT * FROM usuario WHERE login=?";
    private static final String USUARIO_LOGIN_QUERY2 = "SELECT * FROM usuario WHERE login=? or email=? or tarjeta=?";
    private static final String USUARIO_LOGIN_INSERT = 
            "INSERT INTO usuario (nombre,login,password,email,direccion,telefono,tarjeta,activo) VALUES (?,?,?,?,?,?,?,1)";
    private static final String CONTACTO_INSERT = 
           "INSERT INTO contacto (nombre,email,mensaje) VALUES (?,?,?)";
  

    private static final String PEDIDO_ID = "SELECT MAX(id) FROM pedidos WHERE 1";

    private static final String ESTADO_PEDIDO_QUERY = "SELECT * FROM estado_pedido";

    private static final String PEDIDOS_INSERT = 
            "INSERT INTO pedidos (id,uid,direccion,telefono,tarjeta,cantidad,estado_pedido,fech)"
            + " VALUES (?,?,?,?,?,?,?,'"+java.time.LocalDate.now()+"')";

    private static final String PEDIDO_PRODUCTO_INSERT = 
            "INSERT INTO pedido_producto (id_pedido,id_producto,cantidad,precio) VALUES (?,?,?,?)";

    private static final String UPDATE_USUARIO_QUERY = 
            "UPDATE usuario SET nombre=?, password=?, email=?, direccion=?, telefono=?, tarjeta=? "
            + "WHERE id= ?";

    private static final String PEDIDOS_USUARIO_QUERY = "SELECT * FROM pedidos WHERE uid=?";

    private static final String PRODUCTOS_PEDIDO_ID_QUERY = 
            "SELECT * FROM pedido_producto WHERE id_pedido = ?";

    private static final String UPDATE_CANCELA_ESTADO_PEDIDO = "UPDATE pedidos SET estado_pedido=4 WHERE id=?";

    public AccesoBD() {
        conexionBD = null;
    }

    public void abrirConexionBD() throws Exception {

        String nombreConexionBD;

        if (conexionBD == null) {

            try {

                Class.forName("com.mysql.jdbc.Driver");

                nombreConexionBD = "jdbc:mysql://localhost/" + DEFAULT_DATA_BASE_NAME;

                conexionBD = DriverManager.getConnection(
                        nombreConexionBD,
                        DEFAULT_DATA_BASE_USER,
                        DEFAULT_DATA_BASE_PASSWORD);

            } catch (ClassNotFoundException | SQLException e) {
                throw e;
                
            }
        }
    }


    public boolean comprobarAcceso() {
        return (conexionBD != null);
    }

    public void cerrarConexionBD() throws Exception {
        if (comprobarAcceso()) {
            conexionBD.close();
            conexionBD = null;
        }
    }

    public List<Producto> obtenerProductosBD() throws Exception {

        List<Producto> productos;

        productos = new ArrayList();

        try {
            abrirConexionBD();

            Statement st = conexionBD.createStatement();

            ResultSet rs = st.executeQuery(PRODUCTOS_QUERY);

            while (rs.next()) {
                Producto bean = new Producto();

                bean.setId(rs.getInt("id"));
                bean.setNombre(rs.getString("nombre"));
                bean.setDescripcion(rs.getString("descripcion"));
                bean.setPrecio(rs.getFloat("precio"));
                bean.setCantidad(rs.getInt("existencias"));
                bean.setMarca(rs.getString("marca"));
                bean.setUrlimagen(rs.getString("urlimagen"));
                bean.setIdcategoria(rs.getInt("idcategoria"));
                bean.setDestacado(rs.getBoolean("destacado"));

                productos.add(bean);
            }

            cerrarConexionBD();

        } catch (Exception e) {
            System.err.print(e);
            throw e;
            
        } 

        return productos;

    }

    public Producto obtenerProductoBD(int id) throws Exception {
        Producto p = null;

        try {
            abrirConexionBD();

            PreparedStatement st = conexionBD.prepareStatement(PRODUCTO_ID_QUERY);

            st.setInt(1, id);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                p = new Producto();

                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setPrecio(rs.getFloat("precio"));
                p.setCantidad(rs.getInt("existencias"));
                p.setMarca(rs.getString("marca"));
                p.setUrlimagen(rs.getString("urlimagen"));
                p.setIdcategoria(rs.getInt("idcategoria"));
                p.setDestacado(rs.getBoolean("destacado"));
            }

            cerrarConexionBD();

        } catch (Exception e) {
            System.err.print(e);
            throw e;
        }

        return p;
    }

    public List<Categoria> obtenerCategoriasBD() throws Exception {
        List<Categoria> categorias = new ArrayList();

        try {
            abrirConexionBD();

            Statement st = conexionBD.createStatement();

            ResultSet rs = st.executeQuery(CATEGORIAS_QUERY);

            while (rs.next()) {
                Categoria bean = new Categoria();

                bean.setId(rs.getInt("id"));
                bean.setNombre(rs.getString("nombre"));

                categorias.add(bean);
            }

            cerrarConexionBD();

        } catch (Exception e) {
            System.err.print(e);
            throw e;
        }

        return categorias;
    }

    public Usuario obtenerUsuarioBD(String login) throws Exception {
        Usuario usr = null;

        try {
            abrirConexionBD();

            PreparedStatement st = conexionBD.prepareStatement(USUARIO_LOGIN_QUERY);

            st.setString(1, login);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                usr = new Usuario();
                
                usr.setId(rs.getInt("id"));
                usr.setNombre(rs.getString("nombre"));
                usr.setLogin(rs.getString("login"));
                usr.setPassword(rs.getString("password"));
                usr.setEmail(rs.getString("email"));
                usr.setDireccion(rs.getString("direccion"));
                usr.setTelefono(rs.getInt("telefono"));
                usr.setTarjeta(rs.getString("tarjeta"));
                usr.setActivo(rs.getInt("activo"));
                
            }

            cerrarConexionBD();

        } catch (Exception e) {
            System.err.print(e);
            throw e;
        }

        return usr;
    }
    public Usuario obtenerUsuarioExistoBD(String login,String email,String tarjeta) throws Exception {
        Usuario usr = null;

        try {
            abrirConexionBD();

            PreparedStatement st = conexionBD.prepareStatement(USUARIO_LOGIN_QUERY2);

            st.setString(1, login);
            st.setString(2, email);
            st.setString(3, tarjeta);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                usr = new Usuario();
                
                usr.setId(rs.getInt("id"));
                usr.setNombre(rs.getString("nombre"));
                usr.setLogin(rs.getString("login"));
                usr.setPassword(rs.getString("password"));
                usr.setEmail(rs.getString("email"));
                usr.setDireccion(rs.getString("direccion"));
                usr.setTelefono(rs.getInt("telefono"));
                usr.setTarjeta(rs.getString("tarjeta"));
                usr.setActivo(rs.getInt("activo"));
                
            }

            cerrarConexionBD();

        } catch (Exception e) {
            System.err.print(e);
            throw e;
        }

        return usr;
    }
    
      public Contacto contactoBD (String nombre, String email, String mensaje) throws Exception {
        
        Contacto usr = null;
        
         try {
            abrirConexionBD();

            PreparedStatement st = conexionBD.prepareStatement(CONTACTO_INSERT);

            st.setString(1, nombre);
            st.setString(2, email);
            st.setString(3, mensaje);
           
            st.execute();

            cerrarConexionBD();
            usr = new Contacto();

            usr.setName(nombre);
            usr.setEmail(email);
            usr.setMessage(mensaje);

        } catch (Exception e) {
            System.err.print(e);
            throw e;
        }
        
        return usr;
    }
      
    public Usuario addUsuarioBD (String nombre, String email, String direccion, int telefono, String tarjeta, String login, String pwd) throws Exception {
        
        Usuario usr = null;
        
         try {
            abrirConexionBD();

            PreparedStatement st = conexionBD.prepareStatement(USUARIO_LOGIN_INSERT);

            st.setString(1, nombre);
            st.setString(2, login);
            st.setString(3, pwd);
            st.setString(4, email);
            st.setString(5, direccion);
            st.setInt(6, telefono);
            st.setString(7, tarjeta);
            st.execute();

            cerrarConexionBD();
            
            usr = new Usuario();
            usr.setDireccion(direccion);
            usr.setEmail(email);
            usr.setLogin(login);
            usr.setNombre(nombre);
            usr.setPassword(pwd);
            usr.setTarjeta(tarjeta);
            usr.setTelefono(telefono);

        } catch (Exception e) {
            System.err.print(e);
            throw e;
        }
        
        return usr;
    }


    public List<Estado_Pedido> obtenerEstadosPedidosBD() throws Exception {
        List<Estado_Pedido> estados = new ArrayList();

        try 
        {
            abrirConexionBD();

            Statement st = conexionBD.createStatement();

            ResultSet rs = st.executeQuery(ESTADO_PEDIDO_QUERY);

            while (rs.next()) {
                Estado_Pedido bean = new Estado_Pedido();

                bean.setId(rs.getInt("id"));
                bean.setNombre(rs.getString("nombre"));

                estados.add(bean);
            }

            cerrarConexionBD();

        } catch (Exception e) {
            System.err.print(e);
            throw e;
        }
        

        return estados;
    }

    private Pedido crearPedido (Pedido pedido)
    {
        Pedido res = null;
        
        try
        {
            abrirConexionBD();

            PreparedStatement stPedido = conexionBD.prepareStatement(PEDIDOS_INSERT);
            stPedido.setInt(1, pedido.getId());
            stPedido.setInt(2, pedido.getUid());
            stPedido.setString(3, pedido.getDireccion_envio());
            stPedido.setInt(4, pedido.getTelefono());
            stPedido.setString(5, pedido.getTarjeta());
            stPedido.setDouble(6, pedido.getCantidad());
            pedido.setEstado(2);    
            stPedido.setInt(7, 1);
            stPedido.execute();
            
            ArrayList<Producto> productos = pedido.getProductos();
            for ( Producto producto : productos )
            {

                PreparedStatement stProductos = conexionBD.prepareStatement(PEDIDO_PRODUCTO_INSERT);
                stProductos.setInt(1, pedido.getId());
                stProductos.setInt(2, producto.getId());
                stProductos.setInt(3, producto.getCantidad());
                Float precioTotal = producto.getPrecio() * producto.getCantidad();
                stProductos.setFloat(4, precioTotal);
                stProductos.execute();
            }
          
            cerrarConexionBD();
            
            res = pedido;
            
        } 
        catch (Exception e) { System.err.print(e);  }
        
        return res;
    } 


    private int obtenerNextIDPedidoBD()
    {
        int res = 0;
        
        try
        {
            abrirConexionBD();
            
            ResultSet rs = conexionBD.prepareStatement(PEDIDO_ID).executeQuery();

            while ( rs.next() ) 
            {
                if ( !rs.wasNull() ) res = rs.getInt("MAX(id)");
            }
            
            res++;  
            
            cerrarConexionBD();
        } 
        catch (Exception e) { System.err.print(e); }

        return res;
    } 
    

    public void creaPedidoBD(Pedido pedido)
    {
      
        pedido.setId(obtenerNextIDPedidoBD());
        
      
        crearPedido(pedido);
    }


    public Usuario actualizarUsuario(Usuario update) throws Exception
    {
        Usuario res = null;
        
        try
        {
            abrirConexionBD();

    
            PreparedStatement st = conexionBD.prepareStatement(UPDATE_USUARIO_QUERY);
            st.setString(1, update.getNombre());
            st.setString(2, update.getPassword());
            st.setString(3, update.getEmail());
            st.setString(4, update.getDireccion());
            st.setInt(5, update.getTelefono());
            st.setString(6, update.getTarjeta());
 
            st.setInt(7, update.getId());
            st.execute();
          
            cerrarConexionBD();
            
            res = update;
        } 
        catch (Exception e) { System.err.print(e); throw e; }
        
        
        
        return res;
    }


    public List<Pedido> obtenerPedidosUsuario(Usuario usr) 
    {
        List<Pedido> res = new ArrayList<>();;
        
      
        try
        {   
            abrirConexionBD();
         
            PreparedStatement st = conexionBD.prepareStatement(PEDIDOS_USUARIO_QUERY);
            st.setInt(1, usr.getId());
            ResultSet rs = st.executeQuery();
            
            while ( rs.next() ) 
            {
                Pedido bean = new Pedido();
                
                bean.setId(rs.getInt("id"));
                bean.setUid(rs.getInt("uid"));
                bean.setDireccion_envio(rs.getString("direccion"));
                bean.setTelefono(rs.getInt("telefono"));
                bean.setTarjeta(rs.getString("tarjeta"));
                bean.setCantidad(rs.getFloat("cantidad"));
                bean.setEstado(rs.getInt("estado_pedido"));

                res.add(bean);
            }
            
            cerrarConexionBD();
        }
        catch(Exception e) { System.err.print(e); }
        
    
        try
        {
            abrirConexionBD();
            
            for ( Pedido pedido : res )
            {
                ArrayList<Producto> productos = new ArrayList<Producto>();
                
                PreparedStatement stProductos = conexionBD.prepareStatement(PRODUCTOS_PEDIDO_ID_QUERY);
                stProductos.setInt(1, pedido.getId());
                ResultSet rsProductos = stProductos.executeQuery();
                
                while ( rsProductos.next() ) 
                {
                    Producto producto = new Producto();
                    producto.setId(rsProductos.getInt("id_producto"));
                    producto.setCantidad(rsProductos.getInt("cantidad"));
                    producto.setPrecio(rsProductos.getFloat("precio"));
                    productos.add(producto);
                }
                
                pedido.setProductos(productos);
                
            }
            
            cerrarConexionBD();
        }
        catch(Exception e) { System.err.print(e); }
        
    
        try
        {
            abrirConexionBD();
            
            for ( Pedido pedido : res )
            {
                ArrayList<Producto> productosPedido = pedido.getProductos();
                for ( Producto productoPedido : productosPedido )
                {
                    Producto item = obtenerProductoBD(productoPedido.getId());

                    productoPedido.setNombre(item.getNombre());
                    productoPedido.setDescripcion(item.getDescripcion());
                    productoPedido.setMarca(item.getMarca());
                    productoPedido.setUrlimagen(item.getUrlimagen());
                    productoPedido.setIdcategoria(item.getIdcategoria());
                } 
            } 
            
            cerrarConexionBD();
        }
        catch(Exception e) { System.err.print(e); }
        
        return res;
    }

    public boolean cancelarPedido(int id) 
    {
        boolean res = false;
        
        try
        {
            abrirConexionBD();
            
            PreparedStatement st = conexionBD.prepareStatement(UPDATE_CANCELA_ESTADO_PEDIDO);
            st.setInt(1, id);
            res = st.execute();
            
            cerrarConexionBD();
        }
        catch(Exception e) { System.err.print(e); }
    
        return res;
    }
   
}
