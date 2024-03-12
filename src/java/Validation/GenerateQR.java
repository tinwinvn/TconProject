/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Validation;


import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
/**
 *
 * @author admin
 */
public class GenerateQR {
    public void generateQR(String orderID) throws WriterException, IOException{
        String content = "http://localhost:8080/ProjectSWP/payment/verification_order.jsp?orderID=" + orderID;
        String folderPath = "web/payment/QR/" + orderID +".jpg";
        String dir = GenerateQR.class.getProtectionDomain().getCodeSource().getLocation().getPath();
        File file = new File(dir);
        file = file.getParentFile().getParentFile().getParentFile().getParentFile();
        String absoluteFolderPath = Paths.get(file.toString(), folderPath).toString();
        BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, 500, 500);
        MatrixToImageWriter.writeToPath(bitMatrix, "jpg", Paths.get(absoluteFolderPath));
    }
} 
