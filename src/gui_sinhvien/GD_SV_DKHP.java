package gui_sinhvien;



import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import java.awt.Window;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;

import javax.swing.JComboBox;
import javax.swing.JComponent;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import dao.ChiTietLopHocPhanDao;
import dao.DataBase;
import dao.HocKyDao;
import dao.LopHocPhanDaDangKyDao;
import dao.LopHocPhanDao;
import dao.MonHocPhanDao;
import dao.NamDao;
import dao.PhieuDangKyLopHPDao;

import entity.LopHocPhan;
import entity.LopHocPhanDaDangKy;
import entity.MonHocPhan;


import javax.swing.SwingConstants;
import javax.swing.JButton;
import javax.swing.ListSelectionModel;

public class GD_SV_DKHP extends JFrame implements ActionListener{


	private JPanel contentPane;
	private JLabel lblChonNam, lblChonKy, lblHP, lblLopHP, lblLopHPDK;
	private JTable  tblLopHPDK;
	private JTable tblLopHP_1;
	private JTable tblHocPhan_1;
	private DefaultTableModel tableModel, tableModel1, tableModel2;
	private JComboBox<Integer> cmbHocKy;
	private JComboBox<String> cmbNam;
	private JScrollPane scrHP, scrLopHP, scrLopHPDK;

	private static String massv;
	private JButton btnLoc;
	private JButton btnLoc1;
	private JButton btnHuy;
	private JButton btnDangKy, btnXemLichHoc, btnXemCongNo,btnInDS_Mon_DK;
	
	
	private MonHocPhanDao dsmh = new MonHocPhanDao();
	private LopHocPhanDao dslhp = new LopHocPhanDao();

	private PhieuDangKyLopHPDao pdk = new PhieuDangKyLopHPDao();
	private ChiTietLopHocPhanDao dsct = new ChiTietLopHocPhanDao();
	private PhieuDangKyLopHPDao dsDK = new PhieuDangKyLopHPDao();
	private LopHocPhanDaDangKyDao dsLHP_Da_DK = new LopHocPhanDaDangKyDao();

	private GD_DKNhom gddkNhom;
	private GD_XemLichHoc gdxl;
	private GD_CongNo gdcn;
	

	/**
	 * Launch the application.
	 */
	//	public static void main(String[] args) {
	//		EventQueue.invokeLater(new Runnable() {
	//			public void run() {
	//				try {
	//					GD_SV_DKHP frame = new GD_SV_DKHP(massv);
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
	public GD_SV_DKHP(String maSo) {
		this.massv = maSo;
		//System.out.println(maSo+"gd DKHP");
		setTitle("Ä�Äƒng kÃ½ há»�c pháº§n");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1850, 730);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);

		lblChonNam = new JLabel("Chá»�n nÄƒm há»�c: ");
		lblChonNam.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		lblChonNam.setBounds(1052, 24, 121, 22);
		contentPane.add(lblChonNam);

		cmbNam = new JComboBox<String>();
		cmbNam.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		cmbNam.setBounds(1183, 25, 169, 21);
		contentPane.add(cmbNam);

		lblChonKy = new JLabel("Chá»�n há»�c ká»³: ");
		lblChonKy.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		lblChonKy.setBounds(1052, 57, 121, 24);
		contentPane.add(lblChonKy);

		cmbHocKy = new JComboBox<Integer>();
		cmbHocKy.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		cmbHocKy.setBounds(1183, 59, 169, 21);
		contentPane.add(cmbHocKy);

		//

		lblHP = new JLabel("Danh sÃ¡ch mÃ´n há»�c pháº§n chá»� Ä‘Äƒng kÃ½");
		lblHP.setHorizontalAlignment(SwingConstants.CENTER);
		lblHP.setFont(new Font("Times New Roman", Font.PLAIN, 17));
		lblHP.setBounds(32, 90, 291, 22);
		contentPane.add(lblHP);

		scrHP = new JScrollPane();
		scrHP.setBounds(32, 118, 1320, 131);
		contentPane.add(scrHP);

		String[] headers = "MÃ£ mÃ´n há»�c pháº§n;TÃªn mÃ´n há»�c pháº§n;Sá»‘ tÃ­n chá»‰;Há»�c pháº§n tiÃªn quyáº¿t; Báº¯t buá»™c".split(";");
		tableModel = new DefaultTableModel(headers,0);
		tblHocPhan_1 = new JTable(tableModel);
		tblHocPhan_1.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		tblHocPhan_1.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		scrHP.setViewportView(tblHocPhan_1);


		lblLopHP = new JLabel("Danh sÃ¡ch lá»›p há»�c pháº§n thuá»™c mÃ´n");
		lblLopHP.setHorizontalAlignment(SwingConstants.CENTER);
		lblLopHP.setFont(new Font("Times New Roman", Font.PLAIN, 17));
		lblLopHP.setBounds(32, 260, 274, 25);
		contentPane.add(lblLopHP);

		scrLopHP = new JScrollPane();
		scrLopHP.setBounds(32, 284, 1320, 149);
		contentPane.add(scrLopHP);

		//		tblLopHP = new JTable();

		String[] headers1 = "MÃ£ Lá»›p;Sá»‰ sá»‘; Ä�Ã£ Ä‘Äƒng kÃ½; TÃ¬nh tráº¡ng".split(";");
		tableModel1 = new DefaultTableModel(headers1,0);
		tblLopHP_1 = new JTable(tableModel1);
		tblLopHP_1.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		tblLopHP_1.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		scrLopHP.setViewportView(tblLopHP_1);

		tblLopHP_1.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		scrLopHP.setViewportView(tblLopHP_1);

		btnDangKy = new JButton("Ä�Äƒng kÃ½");
		btnDangKy.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnDangKy.setBounds(1183, 444, 166, 22);
		contentPane.add(btnDangKy);


		lblLopHPDK = new JLabel("Danh sÃ¡ch lá»›p há»�c pháº§n Ä‘Ã£ Ä‘Äƒng kÃ½");
		lblLopHPDK.setHorizontalAlignment(SwingConstants.CENTER);
		lblLopHPDK.setFont(new Font("Times New Roman", Font.PLAIN, 17));
		lblLopHPDK.setBounds(32, 457, 290, 22);
		contentPane.add(lblLopHPDK);

		scrLopHPDK = new JScrollPane();
		scrLopHPDK.setBounds(32, 481, 1320, 140);
		contentPane.add(scrLopHPDK);

		//		tblLopHPDK = new JTable();

		String[] headers2 = "MÃ£ Lá»›p;TÃªn MÃ´n Há»�c Pháº§n; NhÃ³m;Giáº£ng ViÃªn".split(";");
		tableModel2 = new DefaultTableModel(headers2,0);
		tblLopHPDK = new JTable(tableModel2);
		tblLopHPDK.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		tblLopHPDK.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		scrLopHPDK.setViewportView(tblLopHPDK);

		tblLopHPDK.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		scrLopHPDK.setViewportView(tblLopHPDK);

		btnXemLichHoc = new JButton("Xem Lá»‹ch Há»�c");
		btnXemLichHoc.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnXemLichHoc.setBounds(349, 651, 153, 22);
		contentPane.add(btnXemLichHoc);

		btnLoc = new JButton("Lá»�c");
		btnLoc.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnLoc.setBounds(1267, 87, 85, 22);
		contentPane.add(btnLoc);

		JLabel lblngKHc = new JLabel("Ä�Ä‚NG KÃ� Há»ŒC PHáº¦N");
		lblngKHc.setFont(new Font("Times New Roman", Font.BOLD, 26));
		lblngKHc.setBounds(535, 23, 291, 26);
		contentPane.add(lblngKHc);

		btnHuy = new JButton("Há»§y Ä�Äƒng KÃ½");
		btnHuy.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnHuy.setBounds(1183, 630, 166, 20);
		contentPane.add(btnHuy);

		btnLoc1 = new JButton("Lá»�c");
		btnLoc1.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnLoc1.setBounds(1263, 253, 89, 22);
		contentPane.add(btnLoc1);
		
		btnXemCongNo = new JButton("Xem CÃ´ng Ná»£");
		btnXemCongNo.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnXemCongNo.setBounds(151, 651, 153, 22);
		contentPane.add(btnXemCongNo);
		
		btnInDS_Mon_DK = new JButton("In Danh SÃ¡ch Lá»›p Ä�Ã£ Ä�Äƒng KÃ½");
		btnInDS_Mon_DK.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnInDS_Mon_DK.setBounds(535, 651, 291, 22);
		contentPane.add(btnInDS_Mon_DK);

		DataBase.getInstance().connect();
		dulieuHocKy();
		dulieuNamHoc();

		btnLoc.addActionListener(this);
		btnXemLichHoc.addActionListener(this);
		btnDangKy.addActionListener(this);
		btnLoc1.addActionListener(this);
		btnHuy.addActionListener(this);
		btnXemCongNo.addActionListener(this);
		btnInDS_Mon_DK.addActionListener(this);

	}

	public JPanel getJPanel() {
		return contentPane;

	}

	/*
	 * Ä‘á»• dá»¯ liá»‡u
	 */

	public void dulieuHocKy() {
		ArrayList<Integer> listHocKy = new HocKyDao().getDSHocKy();
		if (listHocKy==null) {
			JOptionPane.showMessageDialog(null, "Loi ket noi");
		} else {
			for (int hk: listHocKy) {
				cmbHocKy.addItem(hk);
			}

		}
	}
	public void dulieuNamHoc() {
		ArrayList<String> listNam = new NamDao().getDSNAm();
		if (listNam==null) {
			JOptionPane.showMessageDialog(null, "Loi ket noi");
		} else {
			for (String nam: listNam) {
				cmbNam.addItem(nam);
			}

		}
	}



	@Override
	public void actionPerformed(ActionEvent e) {
		Object o = e.getSource();
		
		
		if(o.equals(btnLoc)) {
			tableModel.setRowCount(0);
			tableModel1.setRowCount(0);
			tableModel2.setRowCount(0);
			taiBangHPDDK();
			taiBangHP();
		}
		if(o.equals(btnLoc1)) {
			taiBangLHP();
		}
		if(o.equals(btnDangKy)) {
			//kiem tra mon co trung khong
			int row4 = tblLopHP_1.getSelectedRow();
			int row = tblHocPhan_1.getSelectedRow();
			if(row4 <0 )
				JOptionPane.showMessageDialog(this, "Báº¡n chÆ°a chá»�n lá»›p há»�c pháº§n");
			else {
				if(!tblLopHP_1.getValueAt(row4,3).toString().equals("KhÃ³a"))
				{
					if(row4 >= 0 && row >=0) {

						boolean ktHP =  dsmh.ktHocPhanTienQuyet(massv, tblHocPhan_1.getValueAt(row, 3).toString());

						if(ktHP ||tblHocPhan_1.getValueAt(row, 3).toString().equals("") ) {
							boolean kt =  dslhp.KTMon_DaDK(massv,tblLopHP_1.getValueAt(row4,0).toString()); 

							if(!kt) {
								gddkNhom = new GD_DKNhom(massv,tblLopHP_1.getValueAt(row4,0).toString(),Integer.parseInt( cmbHocKy.getSelectedItem().toString()), cmbNam.getSelectedItem().toString() );
								gddkNhom.setVisible(true);

							}else
								JOptionPane.showMessageDialog(this, "Báº¡n Ä‘Ã£ Ä‘Äƒng kÃ½ mÃ´n nÃ y ");
						}else

							JOptionPane.showMessageDialog(this, "báº¡n chÆ°a há»�c mÃ´n tiÃªn quyáº¿t");
					}
				}else
					JOptionPane.showMessageDialog(this, "Lá»›p Ä�Ã£ KhÃ³a Báº¡n khÃ´ng thá»ƒ Ä‘Äƒng kÃ½");
			}
		}
		if(o.equals(btnHuy)) {	
			int rowH = tblLopHPDK.getSelectedRow();
			if(rowH<0 )
				JOptionPane.showMessageDialog(this, "Báº¡n chÆ°a chá»�n lá»›p Ä‘á»ƒ há»§y Ä‘Äƒng kÃ½");
			else 
			{
				int hoinhac = JOptionPane.showConfirmDialog(null,"Báº¡n cÃ³ cháº¯c khÃ´ng","ChÃº Ã½",JOptionPane.YES_NO_OPTION);
				if(hoinhac ==JOptionPane.YES_OPTION) {
					if(pdk.xoaPhieuDangKy(massv, tblLopHPDK.getValueAt(rowH, 0).toString())) {
						int a = dslhp.LaySiSoDK(tblLopHPDK.getValueAt(rowH, 0).toString());
						int b = a-1;
						dslhp.capNhatSiSo(b,tblLopHPDK.getValueAt(rowH, 0).toString());
						JOptionPane.showMessageDialog(this, "xÃ³a ThÃ nh cÃ´ng");
						taiBangHPDDK();
					}else {
						JOptionPane.showMessageDialog(this, "xÃ³a Tháº¥t báº¡i");
					}
					
				}
				
			}			
		}
		if(o.equals(btnXemLichHoc)) {
			gdxl = new GD_XemLichHoc(massv, cmbNam.getSelectedItem().toString(), Integer.parseInt(cmbHocKy.getSelectedItem().toString()));
			gdxl.setVisible(true);
		}
		if(o.equals(btnXemCongNo)) {
			gdcn = new GD_CongNo(massv, Integer.parseInt(cmbHocKy.getSelectedItem().toString()), cmbNam.getSelectedItem().toString());
			gdcn.setVisible(true);
		}
		
		if(o.equals(btnInDS_Mon_DK)) {
			try {
				XSSFWorkbook workbook = new XSSFWorkbook();
				XSSFSheet sheet = workbook.createSheet("BÃ¡o cÃ¡o");
				XSSFCellStyle style = tieudebang(workbook);
				XSSFCellStyle style2 = tieudetrang(workbook);
				//Táº¡o tá»«ng dÃ²ng
				int rownum = 0;
				Cell cell = null;
				Row row;

				row = sheet.createRow(rownum);
				cell  = row.createCell(0,CellType.STRING);
				cell.setCellValue("DANH SÃ�CH Lá»šP Há»ŒC PHáº¦N Ä�Ãƒ Ä�Ä‚NG KÃ�");
				cell.setCellStyle(style2);
				rownum++;
				rownum++;
				
				row = sheet.createRow(rownum);
				cell = row.createCell(0,CellType.STRING);
				cell.setCellValue("MÃ£ sinh viÃªn:");
				cell.setCellStyle(style);

				cell = row.createCell(1,CellType.STRING);
				cell.setCellValue(massv);
				cell.setCellStyle(style);
				rownum++;

				row = sheet.createRow(rownum);
				cell = row.createCell(0,CellType.STRING);
				cell.setCellValue("Há»�c kÃ¬:");
				cell.setCellStyle(style);

				cell = row.createCell(1,CellType.STRING);
				cell.setCellValue(cmbHocKy.getSelectedItem().toString());
				cell.setCellStyle(style);
				rownum++;

				row = sheet.createRow(rownum);
				cell = row.createCell(0,CellType.STRING);
				cell.setCellValue("NÄƒm há»�c:");
				cell.setCellStyle(style);

				cell = row.createCell(1,CellType.STRING);
				cell.setCellValue(cmbNam.getSelectedItem().toString());
				cell.setCellStyle(style);

				rownum++;
				rownum++;
				row = sheet.createRow(rownum);
				///Táº¡o tiÃªu Ä‘á»� cho báº£ng
				// MÃ£ lá»›p há»�c pháº§n
				cell = row.createCell(0, CellType.STRING);
				cell.setCellValue("MÃ£ lá»›p");
				cell.setCellStyle(style);
				// TÃªn mÃ´n há»�c pháº§n
				cell = row.createCell(1, CellType.STRING);
				cell.setCellValue("TÃªn mÃ´n há»�c pháº§n");
				cell.setCellStyle(style);
				// NhÃ³m thá»±c hÃ nh
				cell = row.createCell(2, CellType.STRING);
				cell.setCellValue("NhÃ³m");
				cell.setCellStyle(style);
				//TÃªn giáº£ng viÃªn
				cell = row.createCell(3, CellType.STRING);
				cell.setCellValue("Giáº£ng viÃªn");
				cell.setCellStyle(style);


				ArrayList<LopHocPhanDaDangKy> list = dsLHP_Da_DK.layDS_DaDK(massv, Integer.parseInt(
						cmbHocKy.getSelectedItem().toString()), cmbNam.getSelectedItem().toString());

				if(list!=null) {
					for (LopHocPhanDaDangKy lh : list) {
						rownum++;
						row = sheet.createRow(rownum);
						//MÃ£ lá»›p há»�c pháº§n
						cell = row.createCell(0, CellType.STRING);
						cell.setCellValue(lh.getMaLop());
						//TÃªn mÃ´n há»�c pháº§n
						cell = row.createCell(1, CellType.STRING);
						cell.setCellValue(lh.getTenMonHoc());
						//NhÃ³m thá»±c hÃ nh
						cell = row.createCell(2, CellType.STRING);
						cell.setCellValue(lh.getNhom());
						//Giáº£ng viÃªn
						cell = row.createCell(3, CellType.STRING);
						cell.setCellValue(lh.getGiangVien());
					}
				}
				//save file
				if(tableModel.getRowCount()>0) {
					File file = new File("./baocao/sinhvien/DanhSachLopHPDaDK.xlsx");
					file.getParentFile().mkdirs();

					FileOutputStream outFile = new FileOutputStream(file);
					workbook.write(outFile);
					JOptionPane.showMessageDialog(null, "In thÃ nh cÃ´ng");
				}else {
					JOptionPane.showMessageDialog(null, "ChÆ°a cÃ³ dá»¯ liá»‡u trÃªn báº£ng");
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		

	}
	
	/*
	 * Táº¡o kiá»ƒu chá»¯
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

		//KÃ­ch cá»¡
		font.setFontHeightInPoints((short)18);;
		//MÃ u sáº¯c
		font.setColor(IndexedColors.BLACK.index);

		//Kiá»ƒu
		XSSFCellStyle style = workbook.createCellStyle();
		style.setFont(font);
		return style;
	}
	private void taiBangLHP() {
		// TODO Auto-generated method stub
		int row = tblHocPhan_1.getSelectedRow();
		if(row>=0) {
			ArrayList<LopHocPhan> list = dslhp.LayDSLop(tblHocPhan_1.getValueAt(row,0).toString(), Integer.parseInt(cmbHocKy.getSelectedItem().toString()),cmbNam.getSelectedItem().toString() );
			tableModel1.setRowCount(0);
			for (LopHocPhan lhp : list) {
				if(lhp.getSiSo() == lhp.getSoLuongDK() ) {
					String [] rowData = {lhp.getMaLopHP(),lhp.getSiSo()+"",lhp.getSoLuongDK()+"", "KhÃ³a"};
					tableModel1.addRow(rowData);
				}
				if( lhp.getSoLuongDK() > lhp.getSiSo()*60/100 && lhp.getSoLuongDK() < lhp.getSiSo()) {
					String [] rowData = {lhp.getMaLopHP(),lhp.getSiSo()+"",lhp.getSoLuongDK()+"", "cháº¥p nháº­n má»Ÿ lá»›p"};
					tableModel1.addRow(rowData);
				}
				if( lhp.getSoLuongDK() < lhp.getSiSo()*60/100) {
					String [] rowData = {lhp.getMaLopHP(),lhp.getSiSo()+"",lhp.getSoLuongDK()+"", "chá»� sinh viÃªn Ä‘Äƒng kÃ½"};
					tableModel1.addRow(rowData);
				}
			}
			tblLopHP_1.setModel(tableModel1);
		}
		if(row <0 )
			JOptionPane.showMessageDialog(this, "Báº¡n chÆ°a chá»�n  há»�c pháº§n");
	}

	public void taiBangHP() {
		tableModel.setRowCount(0);
		ArrayList<MonHocPhan> list = dsmh.LayCacMonDuocDangKy(massv, cmbNam.getSelectedItem().toString(),Integer.parseInt( cmbHocKy.getSelectedItem().toString()));
		//System.out.println(list);
		if(list.size()<=0) {
			JOptionPane.showMessageDialog(null, "Sinh viÃªn chÆ°a Ä‘Æ°á»£c Ä‘Äƒng kÃ­ kÃ¬ nÃ y");
		}else {
			for (MonHocPhan mh : list) {
				String [] rowdata = {mh.getMaMonHocPhan(),mh.getTenMonHocPhan(),mh.getSoTinChi()+"",
						mh.getHocPhanYeuCau(),mh.getBatBuoc()};
				tableModel.addRow(rowdata);
			}
			tblHocPhan_1.setModel(tableModel);
		}

	}
	public void taiBangHPDDK() {
		tableModel2.setRowCount(0);
		
		ArrayList<LopHocPhanDaDangKy> list3 = dsLHP_Da_DK.layDS_DaDK(massv, Integer.parseInt(cmbHocKy.getSelectedItem().toString()), cmbNam.getSelectedItem().toString());
		if(list3.size() > 0 )
		{
			for (LopHocPhanDaDangKy lhp : list3) {
				String [] rowData = {lhp.getMaLop(), lhp.getTenMonHoc(), lhp.getNhom(), lhp.getGiangVien()};
				tableModel2.addRow(rowData);
			}
			tblLopHPDK.setModel(tableModel2);
		}
	}
}
