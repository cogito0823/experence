package sample; /**
 * Sample Skeleton for 'sample.fxml' Controller Class
 */

import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.embed.swing.SwingFXUtils;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.text.Text;
import javafx.stage.FileChooser;
import javafx.stage.Stage;

import javax.imageio.ImageIO;

public class SampleController {

    public TextField n2;
    public TextField n1;
    byte[] image1;//字节型数组存储选择的图片
    File image2;//File类型存储解密后的图片
    byte[] txtone;//字节型数组存储选择的文本
    byte[] txttwo;//字节型数组存储加密后的txtone；
    byte[] txtcipher;//字节型数组存储加密后的文本
    int N=4757;
    int d=1601;
    int e=101;

    @FXML
    private TextArea txt2;

    @FXML
    private TextArea txt1;

    @FXML // ResourceBundle that was given to the FXMLLoader
    private ResourceBundle resources;

    @FXML // URL location of the FXML file that was given to the FXMLLoader
    private URL location;

    @FXML // fx:id="txt"
    private Button txt; // Value injected by FXMLLoader

    @FXML // fx:id="controller"
    private AnchorPane controller; // Value injected by FXMLLoader

    @FXML // fx:id="img"
    private Button img; // Value injected by FXMLLoader

    @FXML // fx:id="encrype1"
    private Button encrype1; // Value injected by FXMLLoader

    @FXML // fx:id="decrype1"
    private Button decrype1; // Value injected by FXMLLoader

    @FXML // fx:id="secret2"
    private TextField secret2; // Value injected by FXMLLoader

    @FXML // fx:id="decrype2"
    private Button decrype2; // Value injected by FXMLLoader

    @FXML // fx:id="img2"
    private ImageView img2; // Value injected by FXMLLoader

    @FXML // fx:id="img1"
    private ImageView img1; // Value injected by FXMLLoader

    @FXML // fx:id="secret1"
    private TextField secret1; // Value injected by FXMLLoader

    @FXML // fx:id="encrype2"
    private Button encrype2; // Value injected by FXMLLoader

    @FXML   //选择文本并显示
    void chooseTxt(ActionEvent event) throws UnsupportedEncodingException {
        File file;
        file = fileChoose();
        fileToBytes(file,true);
        txt1.setText(new String(txtone,"GB2312"));
    }

    @FXML   //选择图片并显示
    void chooseImage(ActionEvent event) throws Exception {
        File file;
        file = fileChoose();
        showImg(file,false);
    }

    @FXML   //解密文本并显示
    void decrypeTxt(ActionEvent event) throws UnsupportedEncodingException {
        this.d=Integer.parseInt(secret1.getText());
        this.N=Integer.parseInt(n1.getText());
        txttwo=Deal.decrype(txtone,d,N);//转译文本加密为字节型数组


        txt2.setText(new String(txttwo,"GB2312"));//显示密文
    }

    @FXML   //加密文本并显示
    void encrypeTxt(ActionEvent event) throws UnsupportedEncodingException {
        this.e=Integer.parseInt(secret1.getText());
        this.N=Integer.parseInt(n1.getText());
        txttwo=Deal.encrype(txtone,e,N);//转译文本加密为字节型数组
        String pathname ="D:\\文档\\OneDrive\\实验\\密码学实验\\第三课\\c_12345678.txt";
        bytesToFile(txttwo,pathname);
        File file = new File(pathname);
        fileToBytes(file,false);
        txt2.setText(new String(txttwo,"GB2312"));
    }

    @FXML   //解密图片并显示
    void decrypeImage(ActionEvent event) throws Exception {
        byte[] image;//存储转译后的二进制密文
        this.d=Integer.parseInt(secret2.getText());
        this.N=Integer.parseInt(n2.getText());
        image=Deal.decrype(txtone,d,N);
        bytesToImgFile(image);
        showImg(image2,true);
    }

    @FXML   //加密图片
    void encrypeImage(ActionEvent event) throws Exception {
        byte[] image;//存储转译后的二进制密文
        this.e=Integer.parseInt(secret2.getText());
        this.N=Integer.parseInt(n2.getText());
        image=Deal.encrype(image1,e,N);
        String pathname ="D:\\文档\\OneDrive\\实验\\密码学实验\\第三课\\cpicture_1234567.txt";
        bytesToFile(image,pathname);
        File file = new File(pathname);
        fileToBytes(file,false);
        txt2.setText(new String(txtcipher,"GB2312"));//显示密文
    }

    @FXML // This method is called by the FXMLLoader when initialization is complete
    void initialize() {
        assert txt != null : "fx:id=\"txt\" was not injected: check your FXML file 'sample.fxml'.";
        assert controller != null : "fx:id=\"controller\" was not injected: check your FXML file 'sample.fxml'.";
        assert img != null : "fx:id=\"img\" was not injected: check your FXML file 'sample.fxml'.";
        assert encrype1 != null : "fx:id=\"encrype1\" was not injected: check your FXML file 'sample.fxml'.";
        assert decrype1 != null : "fx:id=\"decrype1\" was not injected: check your FXML file 'sample.fxml'.";
        assert secret2 != null : "fx:id=\"secret2\" was not injected: check your FXML file 'sample.fxml'.";
        assert decrype2 != null : "fx:id=\"decrype2\" was not injected: check your FXML file 'sample.fxml'.";
        assert img2 != null : "fx:id=\"img2\" was not injected: check your FXML file 'sample.fxml'.";
        assert img1 != null : "fx:id=\"img1\" was not injected: check your FXML file 'sample.fxml'.";
        assert secret1 != null : "fx:id=\"secret1\" was not injected: check your FXML file 'sample.fxml'.";
        assert encrype2 != null : "fx:id=\"encrype2\" was not injected: check your FXML file 'sample.fxml'.";

    }

    //文件选择器，选择时先进行清空所有文本图片域操作。
    File fileChoose(){
        txt1.clear();
        txt2.clear();
        img1.setImage(null);
        img2.setImage(null);
        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Open Resource File");
        fileChooser.setInitialDirectory(new File(System.getProperty("user.dir")));
        File file = fileChooser.showOpenDialog(new Stage());
        return file;
    }

    //显示图片，若b为true则显示在“img2”,否则显示在“img1”
    void showImg(File file,boolean b) throws Exception{

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {

            BufferedImage bi;
            bi = ImageIO.read(file);
            if(b){
                img2.setImage(SwingFXUtils.toFXImage(bi, null));
            }else{
                img1.setImage(SwingFXUtils.toFXImage(bi, null));
                ImageIO.write(bi, "jpg", baos);
                this.image1 = baos.toByteArray();

            }
//            System.err.println(image1.length);
        } catch (IOException e) {
            e.printStackTrace();
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            baos.close();
        }
    }

    //将字节型数组转化成File型，传给image2
    void bytesToImgFile(byte[] image1) throws Exception {
        ByteArrayInputStream bais = new ByteArrayInputStream(image1);
        BufferedImage bi1 =ImageIO.read(bais);
        try {
            File w2 = new File("D:\\文档\\OneDrive\\实验\\密码学实验\\第三课\\cmPicture_2345678.jpg");
            ImageIO.write(bi1, "jpg", w2);
            this.image2 = w2;
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            bais.close();
        }
    }

    //将File类型转化成byte数组，若a为真，传给txtone,否则传给txtcipher
    void fileToBytes(File file,boolean a){

        try {
            FileInputStream in=new FileInputStream(file);
            // size  为字串的长度 ，这里一次性读完
            int size=in.available();
            byte[] buffer=new byte[size];
            in.read(buffer);
            in.close();
            if(a){
                this.txtone=buffer;
            }else{
                this.txtcipher=buffer;
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //将byte数组转化成file类型txt文档，保存在pathname。
    public void bytesToFile(byte[] bytes,String pathname) {
        try {
            FileOutputStream fos = new FileOutputStream(pathname);
            fos.write(bytes);
            fos.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
