package gui_nhanvien;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import dao.DataBase;
import dao.LopHocPhanDao;
import entity.LopHocPhan;
import entity.MonHocPhan;
import entity.ThongKeLop;

import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.swing.JTextField;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JButton;

public class GD_NhanVien_XemChiTiet extends JFrame implements ActionListener{
	

	private JPanel contentPane;
	private String maMon;
	private String tenMon;
	private String Nam;
	private	int hocKy,tongLop;
	private JTextField txtMaMon;
	private JTextField txtTenMon;
	private JTextField txtNam;
	private JTextField txtHocKy;
	private JTable table;
	private JTable table_1;
	private DefaultTableModel tableModel;
	private JButton btnIn;
	private LopHocPhanDao dslhp = new LopHocPhanDao();
	private JTextField txtTongSo;
	/**
	 * Launch the application.
	 */
//	public static void main(String[] args) {
//		EventQueue.invokeLater(new Runnable() {
//			public void run() {
//				try {
//					GD_NhanVien_XemChiTiet frame = new GD_NhanVien_XemChiTiet();
//					frame.setVisible(true);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		});
//	}

	/**
	 * Create the frame.
	 */
	public GD_NhanVien_XemChiTiet(String maMon,String tenMon,String nam,int hocKy,int tongSoLop) {
		this.maMon = maMon;
		this.tenMon = tenMon;
		this.Nam = nam;
		this.hocKy = hocKy;
		this.tongLop = tongSoLop;
		
		
		//System.out.println(maMon+ tenMon + nam + hocKy + "Giao dien xem chi tiet");
		//setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1300, 700);
		setLocationRelativeTo(null);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		
		JPanel pnlTong = new JPanel();
		contentPane.add(pnlTong, BorderLayout.CENTER);
		pnlTong.setLayout(null);
		
		JLabel lblDanhSchLp = new JLabel("DANH S??CH L???P C???A M??N");
		lblDanhSchLp.setFont(new Font("Times New Roman", Font.BOLD, 18));
		lblDanhSchLp.setBounds(500, 24, 271, 25);
		pnlTong.add(lblDanhSchLp);
		
		JLabel lblMaMon = new JLabel("M?? m??n h???c ph???n:");
		lblMaMon.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblMaMon.setBounds(100, 60, 142, 30);
		pnlTong.add(lblMaMon);
		
		JLabel lblTenMon = new JLabel("T??n m??n h???c ph???n:");
		lblTenMon.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblTenMon.setBounds(100, 95, 142, 30);
		pnlTong.add(lblTenMon);
		
		txtMaMon = new JTextField();
		txtMaMon.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		txtMaMon.setEditable(false);
		txtMaMon.setText(maMon);
		txtMaMon.setBounds(230, 63, 300, 30);
		pnlTong.add(txtMaMon);
		txtMaMon.setColumns(10);
		
		txtTenMon = new JTextField();
		txtTenMon.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		txtTenMon.setEditable(false);
		txtTenMon.setText(tenMon);
		txtTenMon.setColumns(10);
		txtTenMon.setBounds(230, 98, 300, 30);
		pnlTong.add(txtTenMon);
		
		JLabel lblNam = new JLabel("N??m:");
		lblNam.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblNam.setBounds(590, 60, 142, 30);
		pnlTong.add(lblNam);
		
		JLabel lblHocKy = new JLabel("H???c K???:");
		lblHocKy.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblHocKy.setBounds(590, 95, 142, 30);
		pnlTong.add(lblHocKy);
		
		txtNam = new JTextField();
		txtNam.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		txtNam.setEditable(false);
		txtNam.setText(nam);
		txtNam.setColumns(10);
		txtNam.setBounds(673, 63, 300, 30);
		pnlTong.add(txtNam);
		
		txtHocKy = new JTextField();
		txtHocKy.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		txtHocKy.setEditable(false);
		txtHocKy.setText(hocKy+"");
		txtHocKy.setColumns(10);
		txtHocKy.setBounds(673, 98, 300, 30);
		pnlTong.add(txtHocKy);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(65, 152, 1115, 335);
		pnlTong.add(scrollPane);
		
		table = new JTable();
		String[] headers = "M?? l???p h???c ph???n;M?? m??n h???c ph???n;S?? s???;N??m;H???c K???".split(";");
		tableModel = new DefaultTableModel(headers,0);
		table_1 = new JTable(tableModel);
		table_1.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		scrollPane.setViewportView(table_1);
		
		btnIn = new JButton("In");
		btnIn.setFont(new Font("Times New Roman", Font.BOLD, 14));
		btnIn.setBounds(1080, 562, 100, 23);
		pnlTong.add(btnIn);
		
		JLabel lblTongSo = new JLabel("T???ng s??? l???p:");
		lblTongSo.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblTongSo.setBounds(860, 508, 142, 30);
		pnlTong.add(lblTongSo);
		
		txtTongSo = new JTextField();
		txtTongSo.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		txtTongSo.setEditable(false);
		txtTongSo.setText(tongSoLop+"");
		txtTongSo.setBounds(1012, 509, 168, 30);
		pnlTong.add(txtTongSo);
		txtTongSo.setColumns(10);
		
		btnIn.addActionListener(this);
		
		DataBase.getInstance().connect();
		updatetable();
		
	}
	
	
	public void updatetable() {
		ArrayList<LopHocPhan> list = dslhp.LayDSLopTheoMaMon(Nam, hocKy, maMon);
		for (LopHocPhan lh : list) {
			String [] rowdata = {lh.getMaLopHP(),lh.getMaMHP(),lh.getSiSo()+"",lh.getNam(),
					lh.getHocKy()+""};
			tableModel.addRow(rowdata);
		}
		table_1.setModel(tableModel);
		
	}
	/*
	 * T???o ti??u ????? 
	 */
	
	private static	XSSFCellStyle tieudebang(XSSFWorkbook workbook) {
		XSSFFont font = workbook.createFont();
		font.setBold(true);
		XSSFCellStyle style = workbook.createCellStyle();
		style.setFont(font);
		return style;

	}
	
	private static XSSFCellStyle tieudetrang(XSSFWorkbook workbook) {
		XSSFFont font = workbook.createFont();
		font.setBold(true);
		font.setItalic(true);

		//K??ch c???
		font.setFontHeightInPoints((short)18);;
		//M??u s???c
		font.setColor(IndexedColors.BLACK.index);

		//Ki???u
		XSSFCellStyle style = workbook.createCellStyle();
		style.setFont(font);
		return style;
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		Object o = e.getSource();
		if(o.equals(btnIn)) {
			try {
				XSSFWorkbook workbook = new XSSFWorkbook();
				XSSFSheet sheet = workbook.createSheet("B??o c??o");
				XSSFCellStyle style = tieudebang(workbook);
				XSSFCellStyle style2 = tieudetrang(workbook);
				//T???o t???ng d??ng
				int rownum = 0;
				Cell cell = null;
				Row row;

				row = sheet.createRow(rownum);
				cell  = row.createCell(0,CellType.STRING);
				cell.setCellValue("DANH S??CH L???P C???A M??N");
				cell.setCellStyle(style2);
				rownum++;
				rownum++;

				row = sheet.createRow(rownum);
				cell = row.createCell(0,CellType.STRING);
				cell.setCellValue("M?? m??n h???c ph???n:");
				cell.setCellStyle(style);

				cell = row.createCell(1,CellType.STRING);
				cell.setCellValue(maMon);
				cell.setCellStyle(style);
				
				cell = row.createCell(3,CellType.STRING);
				cell.setCellValue("N??m h???c:");
				cell.setCellStyle(style);

				cell = row.createCell(4,CellType.STRING);
				cell.setCellValue(Nam);
				cell.setCellStyle(style);
				
				
				rownum++;
				rownum++;
				
				row = sheet.createRow(rownum);
				cell = row.createCell(0,CellType.STRING);
				cell.setCellValue("T??n m??n h???c ph???n:");
				cell.setCellStyle(style);

				cell = row.createCell(1,CellType.STRING);
				cell.setCellValue(tenMon);
				cell.setCellStyle(style);
				
				cell = row.createCell(3,CellType.STRING);
				cell.setCellValue("H???c k??:");
				cell.setCellStyle(style);

				cell = row.createCell(4,CellType.STRING);
				cell.setCellValue(hocKy);
				cell.setCellStyle(style);

				rownum++;
				rownum++;
				row = sheet.createRow(rownum);
				///T???o ti??u ????? cho b???ng
				// M?? m??n
				cell = row.createCell(0, CellType.STRING);
				cell.setCellValue("M?? l???p h???c ph???n");
				cell.setCellStyle(style);
				// T??n m??n
				cell = row.createCell(1, CellType.STRING);
				cell.setCellValue("M?? m??n h???c ph???n");
				cell.setCellStyle(style);
				// S??? l???p c???a t???ng m??n
				cell = row.createCell(2, CellType.STRING);
				cell.setCellValue("S?? s???");
				cell.setCellStyle(style);
				
				cell = row.createCell(3, CellType.STRING);
				cell.setCellValue("N??m H???c");
				cell.setCellStyle(style);
				
				cell = row.createCell(4, CellType.STRING);
				cell.setCellValue("H???c k??");
				cell.setCellStyle(style);
				
				ArrayList<LopHocPhan> list = dslhp.LayDSLopTheoMaMon(Nam, hocKy, maMon);
				//System.out.println(list);

				if(list!=null) {
					for (LopHocPhan lh : list) {
						rownum++;
						row = sheet.createRow(rownum);
						//M?? l???p
						cell = row.createCell(0, CellType.STRING);
						cell.setCellValue(lh.getMaLopHP());
						//M?? m??n
						cell = row.createCell(1, CellType.STRING);
						cell.setCellValue(lh.getMaMHP());
						//S?? s???
						cell = row.createCell(2, CellType.NUMERIC);
						cell.setCellValue(lh.getSiSo());
						//N??m H???c
						cell = row.createCell(3, CellType.STRING);
						cell.setCellValue(lh.getNam());
						//H???c k???
						cell = row.createCell(4, CellType.NUMERIC);
						cell.setCellValue(lh.getHocKy());
					}
					rownum++;
					
					row = sheet.createRow(rownum);
					cell = row.createCell(3,CellType.STRING);
					cell.setCellValue("T???ng s??? l???p:");
					cell.setCellStyle(style);

					cell = row.createCell(4,CellType.NUMERIC);
					cell.setCellValue(tongLop);
					cell.setCellStyle(style);

				}
				//save file
				if(tableModel.getRowCount()>0) {
					File file = new File("./baocao/nhanvien/DanhSachLopCuaMon.xlsx");
					file.getParentFile().mkdirs();

					FileOutputStream outFile = new FileOutputStream(file);
					workbook.write(outFile);
					JOptionPane.showMessageDialog(null, "In th??nh c??ng");
				}else {
					JOptionPane.showMessageDialog(null, "Ch??a c?? d??? li???u tr??n b???ng");
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
}
