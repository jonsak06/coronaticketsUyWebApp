/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.interfaces;

import java.util.List;
import root.datatypes.DtArtista;
import root.datatypes.DtEspectaculo;
import root.datatypes.DtFuncion;
import root.datatypes.DtPlataforma;
import root.entidades.EstadoEspectaculo;

/**
 *
 * @author julio
 */
public interface IEspectaculos {
    List<DtPlataforma> listarPlataformas();
    
    public List<DtEspectaculo> listarEspectaculos(String nombre);
    public List<DtFuncion> listarFunciones(String nombreEspectaculo);
    public float getDescuento(String nickname, String nombreFuncion);
    public float getCosto(String nombreFuncion);
    boolean existeEspectaculo(String nombreEspectaculo);
    public DtFuncion getDatosFuncion(String nombreFuncion);
    public boolean ingresarPlataforma(String nombre, String descripcion, String url);
    public boolean estaCompleta(String nombreFuncion);
    public boolean crearFuncion(String nombreEspectaculo, DtFuncion dtFuncion, List<String> artInvi);
    public boolean existeFuncion(String nombreFuncion);
    public List<DtArtista> getInvitados(String nombreFuncion);
    void altaEspectaculo(String plataforma, String artista, List<String> categorias,DtEspectaculo espectaculo, String pathImagen);
    public List<DtEspectaculo> listarRechazados();
    public List<DtEspectaculo> listarIngresados();
    public void aceptar_rechazarIngresado(String nombre, EstadoEspectaculo estado);
    public boolean existePlataforma(String nombrePlat);
    public boolean existeCategoria(String nombreCat);
    public List<DtEspectaculo> listarEspPorCat(String nombreCat);
    public List<String> listarCategorias();
    public List<DtFuncion> funcEspNoReg(String nickname, String nombreEspectaculo);
    public List<DtFuncion> listarTodasLasFunciones(String nombreEsp);
    public List<DtEspectaculo> listarTodosLosEspectaculos();
    public List<DtEspectaculo> listarAceptados();
}
