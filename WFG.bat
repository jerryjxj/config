
@ECHO OFF
CD %Windir%\System32\drivers\etc


echo smarthostsԭʼ����Ϊhttps://smarthosts.googlecode.com/svn/trunk/hosts�����ڶ�����ԭ���Ҳ����ڸ����������
echo Set xPost = CreateObject("Msxml2.XMLHTTP") > lz.vbs
echo xPost.Open "GET","https://raw.githubusercontent.com/liuzheng712/config/master/smarthosts",0 >>lz.vbs
echo xPost.Send() >>lz.vbs
echo Set aGet = CreateObject("ADODB.Stream") >>lz.vbs
echo aGet.Mode = 3 >>lz.vbs
echo aGet.Type = 1 >>lz.vbs
echo aGet.Open()  >>lz.vbs
echo aGet.Write(xPost.responseBody) >>lz.vbs
echo aGet.SaveToFile "smarthosts",2 >>lz.vbs
echo wscript.sleep 1000 '�ӳ�ִ�� >>lz.vbs
echo Downloading smarthosts...
lz.vbs
del lz.vbs

IF not EXIST smarthosts (
    echo can't download
	pause
	exit
)
IF EXIST smarthosts (
IF EXIST hosts.bak (
    type hosts.bak smarthosts>hosts
) ELSE (
    COPY hosts hosts.bak
	type hosts.bak smarthosts>hosts
)
)
pause