/**
 * 请求的方法
 */

import axios from 'axios'
import base from './base'
//node>js 
import qs from 'qs'
// const qs = require('querystring')
const api = {

    //前台
    /**
     * 用户登录接口
     */
    getLogin(params) {//params={lname:'',pwd:''}
        // console.log('520', params, qs.stringify(params));
        return axios.post(base.login, qs.stringify(params))
    },
    //用户注册接口
    getRegister(params) {
        console.log('用户注册params', params);
        console.log('用户注册qs.stringify(params)', qs.stringify(params));
        return axios.post(base.register, qs.stringify(params))
    },
    //根据用户名获取用户信息
    getUserinfo(params) {
        // console.log('根据用户名获取用户信息', params, qs.stringify(params));
        return axios.get(base.userinfo, { params })
    },

    //更改用户信息
    editUser(params) {
        // console.log('更改用户用户信息params', params);
        // console.log('更改用户用户信息qs.stringify(params)', qs.stringify(params));
        return axios.post(base.edituser, qs.stringify(params))
    },

    //用户搜索
    userSearch(params) {
        // console.log('收到了搜索', params, typeof params);
        return axios.get(base.usersearch,
            { params }
        )
    },
    //文章搜索
    articleSearch(params) {
        return axios.get(base.articlesearch, { params })
    },
    //搜索
    getSearch(params) {
        return axios.get(base.getsearch, { params })
    },
    //获取图片
    getPhoto(params) {
        console.log('收到了', params, typeof params);
        return axios.get(base.photo,
            { params }
        )
    },
    //获取所有文章
    getArticle(params) {
        // console.log('收到了', params, typeof params);
        return axios.get(base.getarticle,
            { params }
        )
    },
    //获取所有文章浏览量
    getArticleTotal(params) {
        console.log('收到了', params, typeof params);
        return axios.get(base.getarticletotal,
            { params }
        )
    },
    //获取上架的文章
    getArticleHave(params) {
        // console.log('收到了', params, typeof params);
        return axios.get(base.getarticlehave,
            { params }
        )
    },
    //获取文章详情
    getArticleInfo(params) {
        console.log('收到了文章详情', params, typeof params);
        return axios.get(base.getarticleinfo,
            { params }
        )
    },
    //发表评论
    postComment(params) {
        // console.log('收到了评论', params, typeof params);
        return axios.post(base.postcomment,
            qs.stringify(params)
        )
    },
    //获取评论
    getComment(params) {
        // console.log('收到了评论信息', params, typeof params);
        return axios.get(base.getcomment,
            { params }
        )
    },
    //获取文章评论总数（包括子级评论）
    getCommentTotal(params) {
        // console.log('收到了评论信息', params, typeof params);
        return axios.get(base.getcommenttotal,
            { params }
        )
    },
    //获取评论回复
    getCommentAnswer(params) {
        // console.log('收到了评论信息', params, typeof params);
        return axios.get(base.getcommentanswer,
            { params }
        )
    },



    //后台
    //管理员 登录接口

    getAdminLogin(params) {//params={lname:'',pwd:''}
        // console.log('520', params, qs.stringify(params));
        return axios.post(base.adminlogin, qs.stringify(params))
    },
    //管理员修改密码 editadminpass
    editAdminPass(params) {
        return axios.post(base.editadminpass, qs.stringify(params))
    },
    //获取分页用户
    getUserList(params) {
        // console.log('收到了', params, typeof params);
        return axios.get(base.userlist, {
            params
        })
    },
    //获取所有用户
    getUserTotal(params) {
        // console.log('收到了', params, typeof params);
        return axios.get(base.usertotal, {
            params
        })
    },
    //删除用户
    deleteUser(params) {
        return axios.get(base.deleteuser, {
            params
        })
    },
    //删除图片
    deletePhoto(params) {
        // console.log('删除图片', params);
        return axios.get(base.deletephoto, {
            params
        })
    },
    //上传图片
    addPhoto(params) {
        // console.log('上传图片', params);
        return axios.post(base.addphoto, qs.stringify(params))
    },
    // addPhoto(params) {
    //     console.log('上传图片', params);
    //     return axios.post(base.uploadUrl, qs.stringify(params))
    // },
    //上传视频
    addVideo(params) {
        console.log('上传图片', params);
        return axios.post(base.postvideo, qs.stringify(params))
    },
    //获取视频列表
    getVideo(params) {
        console.log('上传图片', params);
        return axios.get(base.getvideo, { params })
    },
    //删除视频
    deleteVideo(params) {
        // console.log('删除文章', params);
        return axios.get(base.deletevideo, { params })
    },
    //添加文章
    addArticle(params) {
        // console.log('添加文章', params);
        return axios.post(base.addarticle, qs.stringify(params))
    },
    //删除文章
    deleteArticle(params) {
        // console.log('删除文章', params);
        return axios.get(base.deletearticle, { params })
    },
    //上架下架文章 
    hiddenArticle(params) {
        // console.log('上架下架文章 ', params);
        return axios.post(base.updatearticle, qs.stringify(params))
    },
    //根据id编辑文章
    editArticle(params) {
        // console.log('编辑文章 ', params);
        return axios.post(base.updatearticle, qs.stringify(params))
    },
    //把文章移入回收站
    setHuishou
        (params) {
        return axios.post(base.updatearticle, qs.stringify(params))
    },
    //把文章移出回收站
    setArticle
        (params) {
        return axios.post(base.updatearticle, qs.stringify(params))
    },
    //获取热门文章
    getHotList(params) {
        return axios.get(base.gethotlist, { params })
    },
    //浏览量增加
    addLiulanliang(params) {
        // console.log('当前的浏览量', params);
        return axios.post(base.updatearticle, qs.stringify(params))
    },
    //获取文章分类
    getCategoryList(params) {
        return axios.get(base.getcategory, { params })
    },
    //修改分类
    updateCategory(params) {
        return axios.post(base.updatecategory, qs.stringify(params))
    },
    //删除分类
    deleteCategory(params) {
        return axios.post(base.deletecategory, qs.stringify(params))
    },
    //新增分类
    addCategory(params) {
        return axios.post(base.addcategory, qs.stringify(params))
    },
    //获取分类名
    getCategoryName(params) {
        // console.log('分类名', params);
        return axios.get(base.getcategoryname, { params })
    },
    //根据id获取文章分类
    getCategoryId(params) {
        return axios.get(base.getcategoryid, { params })
    },
    //获取文章评论
    getArticleComment(params) {
        return axios.get(base.getarticlecomment, { params })
    },
    ////根据用户名获取评论
    getUserComment(params) {
        return axios.get(base.getusercomment, { params })
    },
    //获取所有评论
    getAllComment(params) {
        return axios.get(base.getallcomment, { params })
    },
    //修改评论状态
    editComment
        (params) {
        return axios.post(base.editcomment, qs.stringify(params))
    },
    //删除评论
    deleteComment(params) {
        // console.log('删除评论', params);
        return axios.get(base.deletecomment, {
            params
        })
    },
    //用户留言
    postMessage
        (params) {
        return axios.post(base.postmessage, qs.stringify(params))
    },
    //获取留言
    getMessage
        (params) {
        return axios.get(base.getmessage, { params })
    },
    //前台获取留言回复
    getMessageAnswer
        (params) {
        return axios.get(base.getmessageanswer, { params })
    },
    //修改留言
    updateMessage
        (params) {
        return axios.post(base.updatemessage, qs.stringify(params))
    },
    //搜索留言
    messageSearch(params) {
        return axios.get(base.messagesearch, { params })
    },
    //根据用户名获取留言
    getUserMessage
        (params) {
        return axios.get(base.getusermessage, { params })
    },
    //删除留言
    deleteMessage
        (params) {
        return axios.get(base.deletemessage, { params })
    },
    //收藏文章
    getCollect(params) {
        return axios.post(base.getcollect, qs.stringify(params))
    },
    //取消收藏文章
    deleteCollect(params) {
        return axios.post(base.deletecollect, qs.stringify(params))
    },
    //查看当前文章是否已经被收藏
    isCollect(params) {
        return axios.get(base.iscollect, { params })
    },
    //获取收藏的文章
    getCollectArticle(params) {
        console.log('获取收藏的文章', params);
        return axios.get(base.getcollectarticle, { params })
    },
}

export default api
