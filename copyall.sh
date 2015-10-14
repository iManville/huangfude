echo 'copy start'
cp -r WebRoot/*  ~/java/apache-tomcat-8.0.26/webapps/ROOT/
echo 'copy end'
echo 'tomcat stop'
sh ~/java/apache-tomcat-8.0.26/bin/shutdown.sh
echo 'tomcat start'
sh ~/java/apache-tomcat-8.0.26/bin/startup.sh
exit
