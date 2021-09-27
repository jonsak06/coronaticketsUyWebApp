package root.entidades;

import java.sql.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import root.entidades.Artista;
import root.entidades.Categoria;
import root.entidades.EstadoEspectaculo;
import root.entidades.Funcion;
import root.entidades.PaqueteDeEspectaculos;
import root.entidades.Plataforma;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-09-27T08:54:13")
@StaticMetamodel(Espectaculo.class)
public class Espectaculo_ { 

    public static volatile SingularAttribute<Espectaculo, String> descripcion;
    public static volatile SingularAttribute<Espectaculo, EstadoEspectaculo> estado;
    public static volatile SingularAttribute<Espectaculo, Artista> artista;
    public static volatile SingularAttribute<Espectaculo, Float> costo;
    public static volatile ListAttribute<Espectaculo, PaqueteDeEspectaculos> paquetes;
    public static volatile ListAttribute<Espectaculo, Categoria> categoria;
    public static volatile SingularAttribute<Espectaculo, String> imagen;
    public static volatile SingularAttribute<Espectaculo, Integer> cantidadMaximaEspectadores;
    public static volatile SingularAttribute<Espectaculo, String> nombre;
    public static volatile SingularAttribute<Espectaculo, String> url;
    public static volatile SingularAttribute<Espectaculo, Date> fechaDeRegistro;
    public static volatile SingularAttribute<Espectaculo, Integer> cantidadMinimaEspectadores;
    public static volatile ListAttribute<Espectaculo, Funcion> funciones;
    public static volatile SingularAttribute<Espectaculo, Plataforma> plataforma;
    public static volatile SingularAttribute<Espectaculo, Integer> duracion;
    public static volatile SingularAttribute<Espectaculo, Long> id;

}