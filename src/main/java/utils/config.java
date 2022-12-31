package utils;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author DTP000
 */
public class config {
    
    // Config for login database
    // Cấu hình thông tin đăng nhập vào database
    public static final String DB_NAME = "java_web"; // test_qlbh2
    public static final String DB_URL = "jdbc:mysql://localhost:3306/" + DB_NAME;
    public static final String USER_NAME = "root";
    public static final String PASSWORD = "";
    
    // Regex for check is email
    // Đoạn regex này dùng để kiểm tra 1 địa chỉ email có đúng dạng name@domain.abc
    public static final String REGEX_MAIL = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

    // Set true while coding for showing bug and set false when Production Environment
    // Đoạn lệnh này để cài đặt để bật/tắt hiển thị lỗi khi code được chạy
    // Lý do thì khi code đã đưa vào hoạt động chính thức thì không được hiện lỗi
    // để tránh người dùng nhìn khó chịu hoặc người khác lợi dụng những 
    // thông báo này để tấn công ứng dụng
    // Chi tiết có thể tham khảo ở link này: https://toidicodedao.com/2019/07/02/environment-trong-lap-trinh/
    public static final boolean DEBUG = true;

}
