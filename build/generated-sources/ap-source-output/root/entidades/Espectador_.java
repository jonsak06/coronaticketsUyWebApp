package root.entidades;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import root.entidades.Compra;
import root.entidades.Registro;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-09-27T08:54:13")
@StaticMetamodel(Espectador.class)
public class Espectador_ extends Usuario_ {

    public static volatile ListAttribute<Espectador, Compra> compras;
    public static volatile SingularAttribute<Espectador, Integer> canjeables;
    public static volatile ListAttribute<Espectador, Registro> registros;

}