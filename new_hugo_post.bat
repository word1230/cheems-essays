@echo off

:: �ؼ����裺�л��� Hugo ��Ŀ�ĸ�Ŀ¼
cd /d "D:\blog\cheems-essays"


set /p post_name="�����������ļ�����Ӣ�ģ����ô���׺��: "

:: ����ȷ�ĸ�Ŀ¼��ִ�� hugo ����
echo.
echo ���ڴ�������: content/posts/%post_name%.md
hugo new posts/%post_name%.md

:: ��ͣһ�£����û����Կ���ִ�н��
echo.
echo �ű�ִ����ϡ�
pause