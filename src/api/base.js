/**
 * 接口路径配置：
 * 一般文件目录：base.js  index.js 
 * 但是公司不一定
 *      config
 *          login  index.js config.js 
 *       index.js 
 *       xxxx.js 
 */

const base = {
    host: 'http://localhost:8989',
    // 基础域名
    //博客前台
    uploadUrl: '/api/api/upload',//图片上传 post请求
    postvideo: '/api/api/postvideo',//视频上传
    getvideo: '/api/api/getvideo',//获取视频列表
    deletevideo: '/api/api/deletevideo', //删除视频
    login: '/api/api/login',//用户登录
    register: '/api/api/register',//用户注册
    userinfo: '/api/api/userinfo',//根据用户名获取用户信息
    edituser: '/api/api/edituser',//更改用户信息
    usersearch: '/api/api/usersearch',//用户搜索
    photo: '/api/api/photo',//获取图片
    // addliulanliang: '/api/api/addliulanliang', //浏览量增加
    getsearch: '/api/api/getsearch',//搜索
    articlesearch: '/api/api/articlesearch', //搜索文章
    gethotlist: '/api/api/gethotlist',//获取热门文章
    getarticle: '/api/api/getarticle',//获取所有文章 
    getarticletotal: '/api/api/getarticletotal',//获取所有文章浏览量
    getarticlehave: '/api/api/getarticlehave',//获取所有文章 
    getarticleinfo: '/api/api/getarticleinfo',//获取文章详情
    getallcomment: '/api/api/getallcomment',//获取所有评论
    getarticlecomment: '/api/api/getarticlecomment',//获取文章评论
    postcomment: '/api/api/postcomment',//发表评论
    getcomment: '/api/api/getcomment',//获取父级评论
    getcommenttotal: '/api/api/getcommenttotal',//获取文章评论总数（包括子级评论）
    getcommentanswer: '/api/api/getcommentanswer',//获取评论回复
    getusercomment: '/api/api/getusercomment', //根据用户名获取评论
    editcomment: '/api/api/editcomment',//修改评论状态
    deletecomment: '/api/api/deletecomment',//删除评论
    adminlogin: '/api/api/adminlogin',//管理员登录
    editadminpass: '/api/api/editadminpass',//管理员修改密码
    userlist: '/api/api/userlist', //用户列表
    usertotal: '/api/api/usertotal', //所有用户列表
    deleteuser: '/api/api/deleteuser',//删除用户
    deletephoto: '/api/api/deletephoto',//删除图片
    addphoto: '/api/api/addphoto',//上传图片
    updatearticle: '/api/api/updatearticle',//修改文章
    addarticle: '/api/api/addarticle',//添加文章
    deletearticle: '/api/api/deletearticle',//删除文章
    getcategory: '/api/api/getcategory', //获取文章分类
    getcategoryid: '/api/api/getcategoryid', //获取id文章分类
    postmessage: '/api/api/postmessage',//用户留言
    getmessage: '/api/api/getmessage', //获取留言
    updatemessage: '/api/api/updatemessage',//修改留言
    getmessageanswer: '/api/api/getmessageanswer', //前台获取留言回复
    messagesearch: '/api/api/messagesearch',//留言搜索
    getusermessage: '/api/api/getusermessage',//根据用户名获取留言
    deletemessage: '/api/api/deletemessage', //上传留言
    getcategoryname: '/api/api/getcategoryname',//获取分类名
    updatecategory: '/api/api/updatecategory',  //修改分类
    addcategory: '/api/api/addcategory',//新增分类
    deletecategory: '/api/api/deletecategory',//删除分类
    getcollect: '/api/api/getcollect',//收藏文章
    deletecollect: '/api/api/deletecollect',//取消收藏文章
    iscollect: '/api/api/iscollect',//查看当前文章是否已经被收藏
    getcollectarticle: '/api/api/getcollectarticle',//获取收藏的文章





}

export default base; 