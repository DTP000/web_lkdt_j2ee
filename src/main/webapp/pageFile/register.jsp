<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
    <div class="modal fade" id="register" tabindex="-1" aria-labelledby="register" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header alert alert-primary">
                    <h5 class="modal-title" id="register">Đăng kí</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="./registerProcess" method="post">
                        <div class="mb-3">
                            <label for="userName" class="form-label">Tên đăng nhập: (*)</label>
                            <input class="form-control" type="text" name="userName" aria-describedby="userNameHelp"
                                required>
                            <div class="invalid-feedback">
                                Vui lòng nhập Tên đăng nhập.
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Số điện thoại: (*)</label>
                            <input class="form-control" type="text" name="phone" required>
                            <div class="invalid-feedback">
                                Vui lòng nhập Số điện thoại.
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="Email" class="form-label">Email: (*)</label>
                            <input class="form-control" type="email" name="email" required>
                            <div class="invalid-feedback">
                                Vui lòng nhập Email.
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Mật khẩu: (*)</label>
                            <input class="form-control" type="password" name="password" required>
                            <div class="invalid-feedback">
                                Vui lòng nhập mật khẩu.
                            </div>
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary">Đăng ký</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>