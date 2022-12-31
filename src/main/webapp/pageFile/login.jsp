<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="login" tabindex="-1" aria-labelledby="login" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header alert alert-primary">
                    <h5 class="modal-title" id="formLogin">Đăng nhập</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="./loginProccess" method="post">
                        <div class="mb-3">
                            <label for="userName" class="form-label">Tên đăng nhập hoặc Email: (*)</label>
                            <input class="form-control" type="text" name="email" required>
                            <div class="invalid-feedback">
                                Xin vui lòng nhập Email.
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
                            <button type="submit" class="btn btn-primary">Đăng nhập</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>