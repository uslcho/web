package pdf;



	import java.awt.Insets;
	import java.io.File;
	import java.net.URL;

	import org.zefer.pd4ml.PD4Constants;
	import org.zefer.pd4ml.PD4ML;

	/**pd4ml use:url pdf file conversion */
public class PdfDownBean {
	 public  static void main(String[] args) throws Exception {

	   String url = "http://www.naver.com/"; //http://www.naver.com
	  
	    //String url = "https://www.google.co.kr/#newwindow=1&q='arial'+is+not+in+pd4fonts.properties+file"; //http://www.naver.com
	    //String url = "http://pd4ml.com/support/pd4ml-html-css-pdf-tips-tricks-f7/ttf-embedding-t42.html"; //http://www.naver.com
	    //String url = "http://www.daum.net/"; //http://www.naver.com

	    File pdfFile = new File("f:/output.pdf");
	    generatePDF(url, pdfFile, PD4Constants.A4);

	          String params = "C:\\Program Files\\Adobe\\Reader 10.0\\Reader\\AcroRd32.exe " + pdfFile.getAbsolutePath();
	          Runtime.getRuntime().exec(params);
	    
	    System.out.println("done.");
	   }


	   private static  void generatePDF(String url, File outputPDFFile, java.awt.Dimension a4)
	     throws Exception {
	    
	    java.io.FileOutputStream fos = new java.io.FileOutputStream(
	      outputPDFFile);
	    PD4ML pd4ml = new PD4ML();
	    pd4ml.setPageInsets(new Insets(0, 0, 0, 0));
	    pd4ml.setHtmlWidth(1200);
	    pd4ml.setPageSize(pd4ml.changePageOrientation(a4));
	    pd4ml.useTTF("f:/temp/fonts", true);//이 코드를 넣어야 한글이 정상적으로 만들어짐
	    pd4ml.setDefaultTTFs("malgun", "arial", "malgun");
	    //pd4ml.enableDebugInfo();

	    long start = System.currentTimeMillis();
	    pd4ml.render(new URL(url), fos);
	    System.out.println("done in " + (System.currentTimeMillis() - start) + "ms");
	   }
}