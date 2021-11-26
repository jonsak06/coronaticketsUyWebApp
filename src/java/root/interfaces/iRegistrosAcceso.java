/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package root.interfaces;

import java.util.List;
import root.datatypes.DtRegistroAcceso;

/**
 *
 * @author julio
 */
public interface iRegistrosAcceso {
    public void ingresarRegistro(DtRegistroAcceso r);
    public List<DtRegistroAcceso> getRegistrosAcceso();
}
