package root.entidades;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import root.entidades.Espectaculo;
import root.entidades.Funcion;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-09-27T08:54:13")
@StaticMetamodel(Artista.class)
public class Artista_ extends Usuario_ {

    public static volatile SingularAttribute<Artista, String> descripcion;
    public static volatile ListAttribute<Artista, Funcion> funciones;
    public static volatile SingularAttribute<Artista, String> linkWeb;
    public static volatile SingularAttribute<Artista, String> biografia;
    public static volatile ListAttribute<Artista, Espectaculo> espectaculos;

}