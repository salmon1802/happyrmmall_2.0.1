GIT_HOME=/developer/git-repository/front/
DEST_PATH=/product/front/


#使用方法：
#启动happyrmmall-fe 	  : ./deploy-fe.sh happyrmmall-fe
#启动happyrmmall-admin-fe : ./deploy-fe.sh happyrmmall-admin-fe

#如果没有后带参数
if [ ! -n "$1" ];
then
    echo -e "Please input a project name! You can input as follows:"
    echo -e "./deploy-fe.sh happyrmmall-fe or ./deploy-fe.sh happyrmmall-admin-fe"
    exit
fi

if [ $1 = "happyrmmall-fe" ];
then
    echo -e "---------Enter Project--------"
    cd $GIT_HOME$1
elif [ $1 = "happyrmmall-admin-fe" ];
then
    echo -e "---------Enter Project--------"
    cd $GIT_HOME$1
else
    echo -e "Invalid Project Name!"
    exit
fi

# clean dist
echo -e "---------Clean Dist--------"
rm -rf ./dist

echo -e "---------Git Pull--------"
git pull

echo -e "---------Yarn Install--------"
yarn install

echo -e "---------Yarn Run Dist--------"
yarn run dist

#判断dist是否存在
if [ -d "./dist" ];
then
    echo -e "---------clean Dest--------"
    rm -rf $DEST_PATH$1/dist

    echo -e "---------copy Dest--------"
    cp -R ./dist $DEST_PATH$1/

    echo -e "---------Deploy Success--------"
else
    echo -e "---------Deploy Fail--------"
fi
