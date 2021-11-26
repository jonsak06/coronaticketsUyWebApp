
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author julio
 */
public class SubirFTP {
    //git
    public static boolean subir(String ruta, String nombreArchivo) throws FileNotFoundException{
    
        File file = new File(ruta);
            FileInputStream entrada = new FileInputStream(file);
            return FtpUtil.uploadFile("raspberrypijulio.ddns.net", 21, "pi", "kilocura2", "", "/DISCO1/ImagenesLab/", nombreArchivo, entrada);
    
    }
    
}
