@echo off

:: 关键步骤：切换到 Hugo 项目的根目录
cd /d "D:\blog\cheems-essays"


set /p post_name="请输入文章文件名（英文，不用带后缀）: "

:: 在正确的根目录下执行 hugo 命令
echo.
echo 正在创建文章: content/posts/%post_name%.md
hugo new posts/%post_name%.md

:: 暂停一下，让用户可以看到执行结果
echo.
echo 脚本执行完毕。
pause