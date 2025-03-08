package Vattu;

import java.sql.*;
import java.util.*;

public class connectsql {
    private Connection connection;

    public connectsql() {
       
        String url = "jdbc:mysql://localhost:3306/TT_Project3_2210900129";
        String username = "root";
        String password = "";

        try {
          
            Class.forName("com.mysql.cj.jdbc.Driver");

            
            connection = DriverManager.getConnection(url, username, password);

            System.out.println("Kết nối tới cơ sở dữ liệu thành công!");

        } catch (SQLException e) {
            // Lỗi kết nối cơ sở dữ liệu
            System.err.println("Không thể kết nối tới cơ sở dữ liệu.");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // Lỗi không tìm thấy driver
            System.err.println("Không tìm thấy driver JDBC.");
            e.printStackTrace();
        }
    }

    // Getter cho connection
    public Connection getConnection() {
        return connection;
    }

    // Đóng kết nối nếu không cần thiết nữa
    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Kết nối đã được đóng.");
            } catch (SQLException e) {
                System.err.println("Lỗi khi đóng kết nối.");
                e.printStackTrace();
            }
        }
    }

    public List<Vattumodel> getAllVattu() {
        List<Vattumodel> vattus = new ArrayList<>();
        try {
            String sql = "SELECT * FROM vattu";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Vattumodel vattu = new Vattumodel(
                    rs.getInt("TT_id_do"),
                    rs.getString("TT_Ten_Do"),
                    rs.getString("TT_Phan_Loai"),
                    rs.getInt("TT_Gia"),
                    rs.getInt("TT_SoLuong")
                );
                vattus.add(vattu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vattus;
    }

    public void addVattu(Vattumodel vattu) {
        try {
            String sql = "INSERT INTO vattu (TT_Ten_Do, TT_Phan_Loai, TT_Gia, TT_SoLuong) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, vattu.getTenDo());
            stmt.setString(2, vattu.getPhanLoai());
            stmt.setInt(3, vattu.getGia());
            stmt.setInt(4, vattu.getSoLuong());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Vattumodel getVattuById(int id) {
        Vattumodel vattu = null;
        try {
            String sql = "SELECT * FROM vattu WHERE TT_id_do = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                vattu = new Vattumodel(
                    rs.getInt("TT_id_do"),
                    rs.getString("TT_Ten_Do"),
                    rs.getString("TT_Phan_Loai"),
                    rs.getInt("TT_Gia"),
                    rs.getInt("TT_SoLuong")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vattu;
    }

    public void updateVattu(Vattumodel vattu) {
        try {
            String sql = "UPDATE vattu SET TT_Ten_Do = ?, TT_Phan_Loai = ?, TT_Gia = ?, TT_SoLuong = ? WHERE TT_id_do = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, vattu.getTenDo());
            stmt.setString(2, vattu.getPhanLoai());
            stmt.setInt(3, vattu.getGia());
            stmt.setInt(4, vattu.getSoLuong());
            stmt.setInt(5, vattu.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteVattu(int id) {
        try {
            String sql = "DELETE FROM vattu WHERE TT_id_do = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
