cd /opt/code/
gulp
echo "Gulp Done"
cp -ar /opt/code/. /usr/share/nginx/html/
echo "Nginx Files Copied"
nginx -g "daemon off;"