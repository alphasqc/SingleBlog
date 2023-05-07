<template>
  <div class="menu">
    <el-menu
      :default-active="$route.path"
      class="el-menu-vertical-demo"
      @open="handleOpen"
      @close="handleClose"
      background-color="rgba(0,0,0,0.5)"
      text-color="#fff"
      active-text-color="#ffd04b"
    >
      <el-menu-item index="/admin/home">
        <i class="iconfont icon-shouye"></i>
        <span slot="title">
          <router-link to="/admin/home"> 首页</router-link>
        </span>
      </el-menu-item>
      <el-submenu index="2">
        <template slot="title">
          <i class="iconfont icon-yonghu"></i>
          <span> 用户管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/admin/userlist">
            <router-link to="/admin/userlist">用户信息 </router-link>
          </el-menu-item>
          <el-menu-item index="admin/adduser">
            <router-link to="/admin/adduser">添加用户</router-link>
          </el-menu-item>
        </el-menu-item-group>
      </el-submenu>
      <el-submenu index="3">
        <template slot="title">
          <i class="iconfont icon-tupian"></i>
          <span> 相册管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/admin/photolist">
            <router-link to="/admin/photolist">相册信息</router-link>
          </el-menu-item>
          <el-menu-item index="/admin/addphoto">
            <router-link to="/admin/addphoto">添加相册</router-link>
          </el-menu-item>
        </el-menu-item-group>
      </el-submenu>
      <el-submenu index="4">
        <template slot="title">
          <i class="iconfont icon-shipin"></i>
          <span> 视频管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/admin/videolist">
            <router-link to="/admin/videolist">视频信息</router-link>
          </el-menu-item>
          <el-menu-item index="/admin/addvideo">
            <router-link to="/admin/addvideo">添加视频</router-link>
          </el-menu-item>
        </el-menu-item-group>
      </el-submenu>
      <el-menu-item index="/admin/articlelist">
        <i class="iconfont icon-16"></i>
        <span slot="title">
          <router-link to="/admin/articlelist"> 文章管理</router-link>
        </span>
      </el-menu-item>
      <el-menu-item index="/admin/category">
        <i class="iconfont icon-fenlei"></i>
        <span slot="title">
          <router-link to="/admin/category"> 类别管理</router-link>
        </span>
      </el-menu-item>
      <el-menu-item index="/admin/message">
        <i class="iconfont icon-liuyanban"></i>
        <span slot="title">
          <router-link to="/admin/message"> 留言管理</router-link>
        </span>
      </el-menu-item>
      <el-menu-item index="/admin/system">
        <i class="iconfont icon-xiugaimima"></i>
        <span slot="title">
          <router-link to="/admin/system"> 修改密码</router-link>
        </span>
      </el-menu-item>
      <el-menu-item index="/home">
        <i class="iconfont icon-fanhui"></i>
        <span slot="title">
          <router-link to="/home"> 返回前台</router-link>
        </span>
      </el-menu-item>
    </el-menu>
  </div>
</template>

<script>
export default {
  name: "Mymenu",
  props: ["admin"],
  methods: {
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    },
    //element-ui导航菜单使用刷新后高亮显示不一致完美解决办法
    handleSelect(key, keyPath) {
      this.$router.push(key);
    },
  },
};
</script>

<style lang="less" scoped>
span {
  width: 100%;
}
.menu {
  position: fixed;
  overflow: auto;
  top: 36px;
  bottom: 0;
  width: 200px;
  height: auto;
  background-color: rgba(0, 0, 0, 0.8);
}
</style>