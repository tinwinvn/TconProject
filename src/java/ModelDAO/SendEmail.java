package ModelDAO;

import Validation.GenerateQR;
import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendEmail {

    public static void sendOTP(String mail, String otp) {
        String email = "taiminhtest@gmail.com";

        String pswd = "eavo dccr fnnv koyg";

        final String senderEmail = email;
        final String password = pswd;
        final String receiverEmail = mail;

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiverEmail));
            message.setSubject("OTP from send-otp");
            message.setText("Your otp is " + otp);
            Transport.send(message);
            System.out.println("Email sent successfully!");
        } catch (MessagingException e) {
            System.out.println("loi");
        }
    }

    public void sendQR(String mail, String emailContent, String imagePath) {
        String email = "taiminhtest@gmail.com";
        String pswd = "eavo dccr fnnv koyg";

        final String senderEmail = email;
        final String password = pswd;
        final String receiverEmail = mail;

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiverEmail));
            message.setSubject("OTP from send-otp");

            // Tạo phần thân của email
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setText(emailContent);

            // Tạo phần thân của email chứa ảnh
            MimeBodyPart imageBodyPart = new MimeBodyPart();
            DataSource source = new FileDataSource(new File(imagePath));
            imageBodyPart.setDataHandler(new DataHandler(source));
            imageBodyPart.setFileName(toSHA256(imagePath.substring(imagePath.length()-8, imagePath.length())));
            
            // Tạo multipart để kết hợp cả phần text và phần ảnh
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);
            multipart.addBodyPart(imageBodyPart);
            // Đặt multipart vào message
            message.setContent(multipart);

            // Gửi email
            Transport.send(message);
            System.out.println("Email sent successfully!");
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Error sending email!");
        }
    }
    
    public void sendVoucherCode(String mail, String voucherCode) {
        String email = "taiminhtest@gmail.com";

        String pswd = "eavo dccr fnnv koyg";

        final String senderEmail = email;
        final String password = pswd;
        final String receiverEmail = mail;

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiverEmail));
            message.setSubject("Voucher from send-voucher");
            message.setText("Your voucher code" + voucherCode);
            Transport.send(message);
            System.out.println("Email sent successfully!");
        } catch (MessagingException e) {
            System.out.println("loi");
        }
    }
    
    public String toSHA256(String string){
        try {
            // Create SHA-1 message digest
            MessageDigest sha1Digest = MessageDigest.getInstance("SHA-256");
            byte[] sha256Hash = sha1Digest.digest(string.getBytes());

            // Encode SHA-1 hash with Base64
            String base64Encoded = Base64.getEncoder().encodeToString(sha256Hash);

            return base64Encoded;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}