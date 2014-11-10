package pdf;



	import java.awt.Insets;
	import java.io.File;
	import java.net.URL;

	import org.zefer.pd4ml.PD4Constants;
	import org.zefer.pd4ml.PD4ML;

	/**pd4ml use:url pdf file conversion */
public class PdfDownBean {
	 public  static void main(String[] args) throws Exception {

		String url = "F:/test.html";
	    File pdfFile = new File("f:/output.pdf");
	    generatePDF(url, pdfFile, PD4Constants.A4);

	          String params = "C:\\Program Files\\Adobe\\Reader 10.0\\Reader\\AcroRd32.exe " + pdfFile.getAbsolutePath();
	          Runtime.getRuntime().exec(params);
	    
	    System.out.println("done.");
	   }


	   private static  void generatePDF(String url, File outputPDFFile, java.awt.Dimension a4)  throws Exception {
	    
	    java.io.FileOutputStream fos = new java.io.FileOutputStream(outputPDFFile);
	    PD4ML pd4ml = new PD4ML();
	    pd4ml.setPageInsets(new Insets(0, 0, 0, 0));
	    pd4ml.setHtmlWidth(1200);
	    pd4ml.setPageSize(pd4ml.changePageOrientation(a4));
	    pd4ml.useTTF("java:fonts", true);//이 코드를 넣어야 한글이 정상적으로 만들어짐
	    pd4ml.setDefaultTTFs("Times New Roman", "Arial", "Courier New");
	    pd4ml.enableDebugInfo();

	    long start = System.currentTimeMillis();
	    pd4ml.render(new URL(url), fos);
	    System.out.println("done in " + (System.currentTimeMillis() - start) + "ms");
	   }
}