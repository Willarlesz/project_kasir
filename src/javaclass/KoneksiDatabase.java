package javaclass;
import java.sql.Connection;
import com.mysql.jdbc.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class KoneksiDatabase {
    private static Connection koneksi;
    public static Connection getConnection() throws SQLException {
    try {
        if (koneksi == null || koneksi.isClosed()) {
            new Driver();
            koneksi = DriverManager.getConnection("jdbc:mysql://localhost:3306/kasirdb", "root", "Ketek12123");
        }
    } catch (SQLException e) {
        throw new SQLException("Gagal koneksi ke database: " + e.getMessage());
    }
    return koneksi;
}
}

