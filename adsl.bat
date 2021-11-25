@echo 断开连接
rasphone -h 宽带连接
@echo 再次连接
pause
@rasdial "宽带连接" "宽带账号" "宽带密码"
