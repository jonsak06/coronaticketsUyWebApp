/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.fabrica;

import serviciosWeb.CtrlEspectaculos;
import serviciosWeb.CtrlPaquetes;
import serviciosWeb.DatosDePruebaCtrl;
import root.interfaces.IEspectaculos;
import serviciosWeb.crlUsuarios;
import root.interfaces.iDatosDePrueba;
import root.interfaces.iPaquetes;
import root.interfaces.iUsuarios;

/**
 *
 * @author julio
 */
public class Fabrica {

    public Fabrica() {
    }
    
    public static iDatosDePrueba getDatosDePrueba(){
        iDatosDePrueba d = new DatosDePruebaCtrl();
        return d;
    }
    
    public static iUsuarios getCrlUsuarios(){
        iUsuarios u = new crlUsuarios();
        return u;
    }
    
    public static IEspectaculos getCtrlEspectaculos(){
        IEspectaculos e = new CtrlEspectaculos();
        return e;
    }
    
    public static iPaquetes getCtrlPaquetes(){
        iPaquetes cp = CtrlPaquetes.getInstance();
        return cp;
    }
    
}
