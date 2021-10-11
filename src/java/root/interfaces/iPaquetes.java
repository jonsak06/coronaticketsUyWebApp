/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.interfaces;
import java.util.List;
import java.sql.Date;
import root.datatypes.DtEspectaculo;
import root.datatypes.DtPaqueteDeEspectaculos;

/**
 *
 * @author dexion
 */
public interface iPaquetes {
    public boolean confirmarAltaPaquete(String nombre, String descripcion, Date fechaInicio, Date fechaFin, float descuento);
    public List<String> listarPaquetes();
    public List<String> listarPaquetesVigentes();
    public List<String> listarPlataformas();
    public List<String> listarEspectaculosNoIncluidos(String nombrePaquete, String nombrePlataforma);
    public void confirmarAgregadoEspectaculo(String nombreEspectaculo, String nombrePaquete);
    public DtPaqueteDeEspectaculos mostrarInfoPaquete(String nombrePaquete);
    public List<String> listarEspectaculosIncluidos(String nombrePaquete);
    public DtEspectaculo mostarInfoEspectaculo(String nombreEspectaculo);
    public void agregarImagenPaquete(String nombrePaquete, String pathImg);
    public List<DtPaqueteDeEspectaculos> listarDtPaquetes();
}
