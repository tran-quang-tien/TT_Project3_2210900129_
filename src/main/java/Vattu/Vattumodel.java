package Vattu;

public class Vattumodel {
    private int id;
    private String tenDo;
    private String phanLoai;
    private int gia;
    private int soLuong;

    public Vattumodel(int id, String tenDo, String phanLoai, int gia, int soLuong) {
        this.id = id;
        this.tenDo = tenDo;
        this.phanLoai = phanLoai;
        this.gia = gia;
        this.soLuong = soLuong;
    }

    public Vattumodel(String tenDo, String phanLoai, int gia, int soLuong) {
        this.tenDo = tenDo;
        this.phanLoai = phanLoai;
        this.gia = gia;
        this.soLuong = soLuong;
    }

  
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTenDo() { return tenDo; }
    public void setTenDo(String tenDo) { this.tenDo = tenDo; }

    public String getPhanLoai() { return phanLoai; }
    public void setPhanLoai(String phanLoai) { this.phanLoai = phanLoai; }

    public int getGia() { return gia; }
    public void setGia(int gia) { this.gia = gia; }

    public int getSoLuong() { return soLuong; }
    public void setSoLuong(int soLuong) { this.soLuong = soLuong; }
}
