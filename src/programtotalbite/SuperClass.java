/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package programtotalbite;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 *
 * @author khofi
 */
public class SuperClass {
    public double Bakso;
    public double MieAyam;
    public double NasiGoreng;
    public double AyamBakar;
    public double Soto;
    
    public double EsJeruk;
    public double EsTeh;
    public double TehHangat;
    public double AirMineral;
    public double Nutrisari;
    
    public double Makanan;
    public double Minuman;
    public double TotalMM;
    
    public double AllTotalMM;
    
    public double GetAmount(){
        Makanan = Bakso + MieAyam + NasiGoreng + AyamBakar + Soto;
        Minuman = EsJeruk + EsTeh + TehHangat + AirMineral + Nutrisari;
        TotalMM = Makanan + Minuman;
        AllTotalMM = TotalMM;
        return AllTotalMM;
    }
    private JFrame frame;
    
    public void iExitSystem(){
        frame = new JFrame("Exit");
        
        if (JOptionPane.showConfirmDialog(frame, "Konfirmasi jika anda ingin keluar", "Aplikasi TotalBite",
                JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION) {
            System.exit(0);
        }
    }
    
    //=================PRICE===================
    public double hBakso = 12.000;
    public double hMieAyam = 10.000;
    public double hNasiGoreng = 12.000;
    public double hAyamBakar = 15.000;
    public double hSoto = 14.000;
    
    public double hEsJeruk = 6.000;
    public double hEsTeh = 6.000;
    public double hTehHangat = 6.000;
    public double hAirMineral = 5.000;
    public double hNutrisari = 6.000;
    
    //================Pajak======================
    public double Pajak = 0.10;
    public double hitungPajak(double hPajak) {
    double jumlahPajak = Pajak * hPajak;
    return jumlahPajak;
    }
}
