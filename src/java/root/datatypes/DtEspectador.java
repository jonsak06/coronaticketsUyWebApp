/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.datatypes;

import java.sql.Date;

/**
 *
 * @author tecnologo
 */
public class DtEspectador extends DtUsuario
{
    private int canjeables;

    public DtEspectador(int canjeables, Long id, String nombre, String apellido, String correo, String nickname, String imagen, Date fechaNacimiento, String pass) {
        super(id, nombre, apellido, correo, nickname, imagen, fechaNacimiento, pass);
        this.canjeables = canjeables;
    }
    public DtEspectador(){}
    public int getCanjeables() {
        return canjeables;
    }
    
    
}
