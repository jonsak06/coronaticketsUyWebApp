/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.interfaces;

import java.util.ArrayList;
import java.util.List;
import root.datatypes.DtArtista;
import root.datatypes.DtEspectaculo;
import root.datatypes.DtEspectador;
import root.datatypes.DtFuncion;
import root.datatypes.DtPaqueteDeEspectaculos;
import root.datatypes.DtPlataforma;
import root.datatypes.DtRegistro;
import root.datatypes.DtUsuario;
import root.entidades.Registro;

/**
 *
 * @author tecnologo
 */

public interface iUsuarios {
//    public List<DtUsuario> getDatos();
    List<DtEspectador> getEspectadores();
    public List<DtArtista> getArtistas();
//    public Usuario getUsuario(String nickname);
    boolean existeUsuario(String nickname);
    void altaArtista(DtArtista ar);
    void altaEspectador(DtEspectador es);
    public void modificarArtista(DtArtista ar);
    public void modificarEspectador(DtEspectador es);
    public List<DtEspectador> getNoRegistrados(String nombreFuncion);
    public int getCanjeables(String nickname);
    public List<DtRegistro> listarCanjeables(String nickname);
    public void canjearRegistros(List<String> canjeables, String nickname, float costo, String nombreFuncion, int fdia, int fmes, int fanio);
    public void registrarUsuario(String nickname, String nombreFuncion, float costo, int fdia, int fmes, int fanio);
    public DtEspectador getDatosEspectador(String nickname);
    public List<DtRegistro> getRegistros(String nickname);
    public List<DtFuncion> getFuncionesRegistros(String nickname);
    public List<DtEspectaculo> listarEspectaculosDeArtista(String nickname);
    public DtPlataforma plataformaEspectaculosDeArtista(String nickname, String nombre);
    public List<DtFuncion> listarFuncionesEspectaculosDeArtista(String nickname, String nombre);
    public List<DtPaqueteDeEspectaculos> listarPaquetesEspectaculosDeArtista(String nickname, String nombre);
    public boolean existeCorreo(String correo);
    public void actualizarRegistros();
    public List<DtUsuario> getUsuariosQueNoSiguesAr(String nickname);
    public List<DtUsuario> getUsuariosQueSiguesAr(String nickname) ;
    public List<DtUsuario> getUsuariosQueNoSiguesEs(String nickname);
    public List<DtUsuario> getUsuariosQueSiguesEs(String nickname);
    public void seguirUsuarioEs(String nickname, String seguido);
    public void seguirUsuarioAr(String nickname, String seguido);
    public void dejarDeSeguirUsuarioEs(String nickname, String seguido);
    public void dejarDeSeguirUsuarioAr(String nickname, String seguido);
    public List<DtPaqueteDeEspectaculos> getPaquetesDelUsuario(String nickname);
    public void comprarPaquete(String nickname, String nombrePaq);
    
}
