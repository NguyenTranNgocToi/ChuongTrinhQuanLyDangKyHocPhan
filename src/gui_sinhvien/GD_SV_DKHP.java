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
		setTitle("?????????ng k???? h???????c ph??????n");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1850, 730);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);

		lblChonNam = new JLabel("Ch???????n n????m h???????c: ");
		lblChonNam.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		lblChonNam.setBounds(1052, 24, 121, 22);
		contentPane.add(lblChonNam);

		cmbNam = new JComboBox<String>();
		cmbNam.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		cmbNam.setBounds(1183, 25, 169, 21);
		contentPane.add(cmbNam);

		lblChonKy = new JLabel("Ch???????n h???????c k??????: ");
		lblChonKy.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		lblChonKy.setBounds(1052, 57, 121, 24);
		contentPane.add(lblChonKy);

		cmbHocKy = new JComboBox<Integer>();
		cmbHocKy.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		cmbHocKy.setBounds(1183, 59, 169, 21);
		contentPane.add(cmbHocKy);

		//

		lblHP = new JLabel("Danh s????ch m????n h???????c ph??????n ch??????? ?????????ng k????");
		lblHP.setHorizontalAlignment(SwingConstants.CENTER);
		lblHP.setFont(new Font("Times New Roman", Font.PLAIN, 17));
		lblHP.setBounds(32, 90, 291, 22);
		contentPane.add(lblHP);

		scrHP = new JScrollPane();
		scrHP.setBounds(32, 118, 1320, 131);
		contentPane.add(scrHP);

		String[] headers = "M???? m????n h???????c ph??????n;T????n m????n h???????c ph??????n;S??????? t????n ch???????;H???????c ph??????n ti????n quy??????t; B??????t bu???????c".split(";");
		tableModel = new DefaultTableModel(headers,0);
		tblHocPhan_1 = new JTable(tableModel);
		tblHocPhan_1.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		tblHocPhan_1.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		scrHP.setViewportView(tblHocPhan_1);


		lblLopHP = new JLabel("Danh s????ch l???????p h???????c ph??????n thu???????c m????n");
		lblLopHP.setHorizontalAlignment(SwingConstants.CENTER);
		lblLopHP.setFont(new Font("Times New Roman", Font.PLAIN, 17));
		lblLopHP.setBounds(32, 260, 274, 25);
		contentPane.add(lblLopHP);

		scrLopHP = new JScrollPane();
		scrLopHP.setBounds(32, 284, 1320, 149);
		contentPane.add(scrLopHP);

		//		tblLopHP = new JTable();

		String[] headers1 = "M???? L???????p;S??????? s???????; ????????? ?????????ng k????; T????nh tr??????ng".split(";");
		tableModel1 = new DefaultTableModel(headers1,0);
		tblLopHP_1 = new JTable(tableModel1);
		tblLopHP_1.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		tblLopHP_1.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		scrLopHP.setViewportView(tblLopHP_1);

		tblLopHP_1.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		scrLopHP.setViewportView(tblLopHP_1);

		btnDangKy = new JButton("?????????ng k????");
		btnDangKy.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnDangKy.setBounds(1183, 444, 166, 22);
		contentPane.add(btnDangKy);


		lblLopHPDK = new JLabel("Danh s????ch l???????p h???????c ph??????n ????????? ?????????ng k????");
		lblLopHPDK.setHorizontalAlignment(SwingConstants.CENTER);
		lblLopHPDK.setFont(new Font("Times New Roman", Font.PLAIN, 17));
		lblLopHPDK.setBounds(32, 457, 290, 22);
		contentPane.add(lblLopHPDK);

		scrLopHPDK = new JScrollPane();
		scrLopHPDK.setBounds(32, 481, 1320, 140);
		contentPane.add(scrLopHPDK);

		//		tblLopHPDK = new JTable();

		String[] headers2 = "M???? L???????p;T????n M????n H???????c Ph??????n; Nh????m;Gi??????ng Vi????n".split(";");
		tableModel2 = new DefaultTableModel(headers2,0);
		tblLopHPDK = new JTable(tableModel2);
		tblLopHPDK.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		tblLopHPDK.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		scrLopHPDK.setViewportView(tblLopHPDK);

		tblLopHPDK.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		scrLopHPDK.setViewportView(tblLopHPDK);

		btnXemLichHoc = new JButton("Xem L???????ch H???????c");
		btnXemLichHoc.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnXemLichHoc.setBounds(349, 651, 153, 22);
		contentPane.add(btnXemLichHoc);

		btnLoc = new JButton("L???????c");
		btnLoc.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnLoc.setBounds(1267, 87, 85, 22);
		contentPane.add(btnLoc);

		JLabel lblngKHc = new JLabel("??????????NG K????? H??????C PH??????N");
		lblngKHc.setFont(new Font("Times New Roman", Font.BOLD, 26));
		lblngKHc.setBounds(535, 23, 291, 26);
		contentPane.add(lblngKHc);

		btnHuy = new JButton("H??????y ?????????ng K????");
		btnHuy.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnHuy.setBounds(1183, 630, 166, 20);
		contentPane.add(btnHuy);

		btnLoc1 = new JButton("L???????c");
		btnLoc1.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnLoc1.setBounds(1263, 253, 89, 22);
		contentPane.add(btnLoc1);
		
		btnXemCongNo = new JButton("Xem C????ng N??????");
		btnXemCongNo.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnXemCongNo.setBounds(151, 651, 153, 22);
		contentPane.add(btnXemCongNo);
		
		btnInDS_Mon_DK = new JButton("In Danh S????ch L???????p ????????? ?????????ng K????");
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
	 * ???????????? d?????? li???????u
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
				JOptionPane.showMessageDialog(this, "B??????n ch????a ch???????n l???????p h???????c ph??????n");
			else {
				if(!tblLopHP_1.getValueAt(row4,3).toString().equals("Kh????a"))
				{
					if(row4 >= 0 && row >=0) {

						boolean ktHP =  dsmh.ktHocPhanTienQuyet(massv, tblHocPhan_1.getValueAt(row, 3).toString());

						if(ktHP ||tblHocPhan_1.getValueAt(row, 3).toString().equals("") ) {
							boolean kt =  dslhp.KTMon_DaDK(massv,tblLopHP_1.getValueAt(row4,0).toString()); 

							if(!kt) {
								gddkNhom = new GD_DKNhom(massv,tblLopHP_1.getValueAt(row4,0).toString(),Integer.parseInt( cmbHocKy.getSelectedItem().toString()), cmbNam.getSelectedItem().toString() );
								gddkNhom.setVisible(true);

							}else
								JOptionPane.showMessageDialog(this, "B??????n ????????? ?????????ng k???? m????n n????y ");
						}else

							JOptionPane.showMessageDialog(this, "b??????n ch????a h???????c m????n ti????n quy??????t");
					}
				}else
					JOptionPane.showMessageDialog(this, "L???????p ????????? Kh????a B??????n kh????ng th?????? ?????????ng k????");
			}
		}
		if(o.equals(btnHuy)) {	
			int rowH = tblLopHPDK.getSelectedRow();
			if(rowH<0 )
				JOptionPane.showMessageDialog(this, "B??????n ch????a ch???????n l???????p ??????????? h??????y ?????????ng k????");
			else 
			{
				int hoinhac = JOptionPane.showConfirmDialog(null,"B??????n c???? ch??????c kh????ng","Ch???? ????",JOptionPane.YES_NO_OPTION);
				if(hoinhac ==JOptionPane.YES_OPTION) {
					if(pdk.xoaPhieuDangKy(massv, tblLopHPDK.getValueAt(rowH, 0).toString())) {
						int a = dslhp.LaySiSoDK(tblLopHPDK.getValueAt(rowH, 0).toString());
						int b = a-1;
						dslhp.capNhatSiSo(b,tblLopHPDK.getValueAt(rowH, 0).toString());
						JOptionPane.showMessageDialog(this, "x????a Th????nh c????ng");
						taiBangHPDDK();
					}else {
						JOptionPane.showMessageDialog(this, "x????a Th??????t b??????i");
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
				XSSFSheet sheet = workbook.createSheet("B????o c????o");
				XSSFCellStyle style = tieudebang(workbook);
				XSSFCellStyle style2 = tieudetrang(workbook);
				//T??????o t??????ng d????ng
				int rownum = 0;
				Cell cell = null;
				Row row;

				row = sheet.createRow(rownum);
				cell  = row.createCell(0,CellType.STRING);
				cell.setCellValue("DANH S?????CH L??????P H??????C PH??????N ????????? ??????????NG K?????");
				cell.setCellStyle(style2);
				rownum++;
				rownum++;
				
				row = sheet.createRow(rownum);
				cell = row.createCell(0,CellType.STRING);
				cell.setCellValue("M???? sinh vi????n:");
				cell.setCellStyle(style);

				cell = row.createCell(1,CellType.STRING);
				cell.setCellValue(massv);
				cell.setCellStyle(style);
				rownum++;

				row = sheet.createRow(rownum);
				cell = row.createCell(0,CellType.STRING);
				cell.setCellValue("H???????c k????:");
				cell.setCellStyle(style);

				cell = row.createCell(1,CellType.STRING);
				cell.setCellValue(cmbHocKy.getSelectedItem().toString());
				cell.setCellStyle(style);
				rownum++;

				row = sheet.createRow(rownum);
				cell = row.createCell(0,CellType.STRING);
				cell.setCellValue("N????m h???????c:");
				cell.setCellStyle(style);

				cell = row.createCell(1,CellType.STRING);
				cell.setCellValue(cmbNam.getSelectedItem().toString());
				cell.setCellStyle(style);

				rownum++;
				rownum++;
				row = sheet.createRow(rownum);
				///T??????o ti????u ???????????? cho b??????ng
				// M???? l???????p h???????c ph??????n
				cell = row.createCell(0, CellType.STRING);
				cell.setCellValue("M???? l???????p");
				cell.setCellStyle(style);
				// T????n m????n h???????c ph??????n
				cell = row.createCell(1, CellType.STRING);
				cell.setCellValue("T????n m????n h???????c ph??????n");
				cell.setCellStyle(style);
				// Nh????m th??????c h????nh
				cell = row.createCell(2, CellType.STRING);
				cell.setCellValue("Nh????m");
				cell.setCellStyle(style);
				//T????n gi??????ng vi????n
				cell = row.createCell(3, CellType.STRING);
				cell.setCellValue("Gi??????ng vi????n");
				cell.setCellStyle(style);


				ArrayList<LopHocPhanDaDangKy> list = dsLHP_Da_DK.layDS_DaDK(massv, Integer.parseInt(
						cmbHocKy.getSelectedItem().toString()), cmbNam.getSelectedItem().toString());

				if(list!=null) {
					for (LopHocPhanDaDangKy lh : list) {
						rownum++;
						row = sheet.createRow(rownum);
						//M???? l???????p h???????c ph??????n
						cell = row.createCell(0, CellType.STRING);
						cell.setCellValue(lh.getMaLop());
						//T????n m????n h???????c ph??????n
						cell = row.createCell(1, CellType.STRING);
						cell.setCellValue(lh.getTenMonHoc());
						//Nh????m th??????c h????nh
						cell = row.createCell(2, CellType.STRING);
						cell.setCellValue(lh.getNhom());
						//Gi??????ng vi????n
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
					JOptionPane.showMessageDialog(null, "In th????nh c????ng");
				}else {
					JOptionPane.showMessageDialog(null, "Ch????a c???? d?????? li???????u tr????n b??????ng");
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		

	}
	
	/*
	 * T??????o ki??????u ch??????
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

		//K????ch c??????
		font.setFontHeightInPoints((short)18);;
		//M????u s??????c
		font.setColor(IndexedColors.BLACK.index);

		//Ki??????u
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
					String [] rowData = {lhp.getMaLopHP(),lhp.getSiSo()+"",lhp.getSoLuongDK()+"", "Kh????a"};
					tableModel1.addRow(rowData);
				}
				if( lhp.getSoLuongDK() > lhp.getSiSo()*60/100 && lhp.getSoLuongDK() < lhp.getSiSo()) {
					String [] rowData = {lhp.getMaLopHP(),lhp.getSiSo()+"",lhp.getSoLuongDK()+"", "ch??????p nh??????n m?????? l???????p"};
					tableModel1.addRow(rowData);
				}
				if( lhp.getSoLuongDK() < lhp.getSiSo()*60/100) {
					String [] rowData = {lhp.getMaLopHP(),lhp.getSiSo()+"",lhp.getSoLuongDK()+"", "ch??????? sinh vi????n ?????????ng k????"};
					tableModel1.addRow(rowData);
				}
			}
			tblLopHP_1.setModel(tableModel1);
		}
		if(row <0 )
			JOptionPane.showMessageDialog(this, "B??????n ch????a ch???????n  h???????c ph??????n");
	}

	public void taiBangHP() {
		tableModel.setRowCount(0);
		ArrayList<MonHocPhan> list = dsmh.LayCacMonDuocDangKy(massv, cmbNam.getSelectedItem().toString(),Integer.parseInt( cmbHocKy.getSelectedItem().toString()));
		//System.out.println(list);
		if(list.size()<=0) {
			JOptionPane.showMessageDialog(null, "Sinh vi????n ch????a ???????????????c ?????????ng k???? k???? n????y");
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
