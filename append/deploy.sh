echo "===========进入git项目happymmall目录============="
cd /developer/git-repository/back-end/happyrmmall_2.0.1
echo "==========git切换分支==============="
git checkout master
echo "==================git fetch======================"
git fetch
echo "==================git pull======================"
git pull
echo "===========编译并跳过单元测试且打生存环境包===================="
mvn clean package -Dmaven.test.skip=true -Pproduct

echo "============删除旧的jar包==================="
rm /product/rmmall.jar

echo "======拷贝编译出来的jar包到/product下======="
cp /developer/git-repository/back-end/happyrmmall_2.0.1/target/rmmall.jar /product/rmmall.jar

echo "====================关闭rmmall.jar====================="
ps -ef|grep rmmall|grep -v grep|awk '{print $2}'|xargs kill -9

echo "================sleep 5s========================="
for i in {1..5}
do
    echo $i"s"
    sleep 1s
done
echo "====================启动spring boot====================="
cd /product
nohup java -jar rmmall.jar >nohup.out 2>&1 &
tail -f nohup.out
#nohup java -jar rmmall.jar &
