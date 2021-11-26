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
public class DtValoracion {
    private Long id;
    private int valor;
    private String nicknameEspectador;
    private String nombreEspectaculo;

    public DtValoracion(Long id,  int valor, String nicknameEspectador, String nombreEspectaculo) {
        this.id = id;
        this.valor = valor;
        this.nicknameEspectador = nicknameEspectador;
        this.nombreEspectaculo = nombreEspectaculo;
    }

    public String getNicknameEspectador() {
        return nicknameEspectador;
    }

    public void setNicknameEspectador(String nicknameEspectador) {
        this.nicknameEspectador = nicknameEspectador;
    }

    

    public String getNombreEspectaculo() {
        return nombreEspectaculo;
    }

    public void setNombreEspectaculo(String nombreEspectaculo) {
        this.nombreEspectaculo = nombreEspectaculo;
    }

    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
    
    
    
    
}
