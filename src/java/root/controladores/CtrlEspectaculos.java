/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.controladores;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import root.datatypes.DtArtista;
import root.datatypes.DtEspectaculo;
import root.datatypes.DtEspectador;
import root.datatypes.DtFuncion;
import root.datatypes.DtPlataforma;
import root.datatypes.DtValoracion;
import root.entidades.EstadoEspectaculo;
import root.interfaces.IEspectaculos;
import root.manejadores.ManEspectaculo;
import root.manejadores.ManPlataformas;

/**
 *
 * @author julio
 */
public class CtrlEspectaculos implements IEspectaculos {
    
    public CtrlEspectaculos(){}
    
    public List<DtPlataforma> listarPlataformas(){
        return ManPlataformas.getDatos();
    }
    
    public  List<DtEspectaculo> listarEspectaculos(String nombre){
        return ManPlataformas.getEspectaculos(nombre);
    }
    
    public boolean existeEspectaculo(String nombreEspectaculo){
        return ManEspectaculo.existeEspectaculo(nombreEspectaculo);
    }
    
    public List<DtFuncion> listarFunciones(String nombreEspectaculo){
        return ManEspectaculo.listarFunciones(nombreEspectaculo);
    }
    
    public float getDescuento(String nickname, String nombreFuncion){
        return ManEspectaculo.getDescuento(nickname, nombreFuncion);
    }
    
    public float getCosto(String nombreFuncion){
        return ManEspectaculo.getCosto(nombreFuncion);
    }
    
    public DtFuncion getDatosFuncion(String nombreFuncion){
        return ManEspectaculo.getDatosFuncion(nombreFuncion);
    }
    
    public boolean existePlataforma(String nombrePlat){
        return ManPlataformas.existePlataforma(nombrePlat);
    }
    
    public boolean ingresarPlataforma(String nombre, String descripcion, String url){
        return ManPlataformas.ingresarPlataforma(nombre, descripcion, url);
    }
    
    public boolean estaCompleta(String nombreFuncion){
        return ManEspectaculo.estaCompleta(nombreFuncion);
    }
    
     public boolean crearFuncion(String nombreEspectaculo, DtFuncion dtFuncion, List<String> artInvi){
         return ManPlataformas.crearFuncion(nombreEspectaculo, dtFuncion, artInvi);
     }
     
     public boolean existeFuncion(String nombreFuncion){
         return ManPlataformas.existeFuncion(nombreFuncion);
     }
     
     public void altaEspectaculo(String plataforma, String artista, List<String> categorias,DtEspectaculo espectaculo, String pathImagen, String descripcionDeLosPremios, int numerodePremios){
        ManEspectaculo.altaEspectaculo(plataforma, artista, categorias,espectaculo, pathImagen, descripcionDeLosPremios, numerodePremios);
     }
     
     public List<DtArtista> getInvitados(String nombreFuncion){
         return ManEspectaculo.getInvitados(nombreFuncion);
     }
     public List<DtEspectaculo> listarRechazados(){
         return ManEspectaculo.listarRechazados();
     }
     
    public List<DtEspectaculo> listarIngresados(){
         return ManEspectaculo.listarIngresados();
     }
    
    public void aceptar_rechazarIngresado(String nombre, EstadoEspectaculo estado){
        ManEspectaculo.aceptar_rechazarIngresado(nombre, estado);
    }
    
    public boolean existeCategoria(String nombreCat){
    return ManEspectaculo.existeCategoria(nombreCat);
    }
    
    public List<DtEspectaculo> listarEspPorCat(String nombreCat){
    return ManEspectaculo.listarEspPorCat(nombreCat);
    }
    
    public List<String> listarCategorias(){
    return ManEspectaculo.listarCategorias();
    }
    
    public List<DtFuncion> funcEspNoReg(String nickname, String nombreEspectaculo){
        return ManEspectaculo.funcEspNoReg(nickname, nombreEspectaculo);
    }
    public List<DtFuncion> listarTodasLasFunciones(String nombreEsp){
        return ManEspectaculo.listarTodasLasFunciones(nombreEsp);
    }
    
    public List<DtEspectaculo> listarTodosLosEspectaculos() {
        return ManEspectaculo.listarEspectaculos();
    }
    
    public List<DtEspectaculo> listarAceptados() {
        return ManEspectaculo.listarAceptados();
    }
    public void calcularValoracion(String nombreEspectaculo){//3ra
        ManEspectaculo.calcularValoracion(nombreEspectaculo);
    }
    
    public List<DtEspectador> listarGanadores(String nombreFun){//3ra
        return ManEspectaculo.listarGanadores(nombreFun);
    }
    public List<DtFuncion> listarFuncionesQuePuedenTenerSorteo(String nombreEsp){//3ra
        return ManEspectaculo.listarFuncionesQuePuedenTenerSorteo(nombreEsp);
    }
    public List<DtFuncion> listarFuncionesConSorteos(String nombreEsp){//3ra
        return ManEspectaculo.listarFuncionesConSorteos(nombreEsp);
    }
    public void finalizarEspectaculo(String nombre){
        ManEspectaculo.finalizarEspectaculo(nombre);
    }
    
     public List<DtValoracion> getValoraciones(String nombreEsp){//3ra
         return ManEspectaculo.getValoraciones(nombreEsp);
     }
}
