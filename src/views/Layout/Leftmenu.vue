<template>
  <el-menu
    :default-active="$route.path"
    class="el-menu-vertical-demo"
    @open="handleOpen"
    @close="handleClose"
    background-color="rgba(0,0,0,0.5)"
    text-color="#fff"
    active-text-color="#ffd04b"
    @select="handleSelect"
  >
    <el-menu-item index="/home">
      <i class="iconfont icon-shouye"></i>
      <span slot="title">
        <router-link to="/home"> 首页</router-link>
      </span>
    </el-menu-item>
    <el-menu-item index="/article">
      <i class="iconfont icon-16"></i>
      <span slot="title">
        <router-link to="/article"> 文章</router-link>
      </span>
    </el-menu-item>

    <el-menu-item index="/todos">
      <i class="iconfont icon-zuozhe2"></i>
      <span slot="title">
        <router-link to="/todos"> 记事本</router-link>
      </span>
    </el-menu-item>

    <el-menu-item index="/photo">
      <i class="iconfont icon-tupian"></i>
      <span slot="title">
        <router-link to="/photo"> 相册</router-link>
      </span>
    </el-menu-item>
    <el-menu-item index="/video">
      <i class="iconfont iconfont icon-shipin"></i>
      <span slot="title">
        <router-link to="/video"> 视频</router-link>
      </span>
    </el-menu-item>
    <el-menu-item index="/messageinfo">
      <i class="iconfont icon-liuyanban"></i>
      <span slot="title">
        <router-link to="/messageinfo"> 留言板</router-link>
      </span>
    </el-menu-item>
    <el-menu-item index="/usercenter">
      <i class="iconfont icon-yonghuxinxi-"></i>
      <span slot="title">
        <router-link to="/usercenter"> 个人中心</router-link>
      </span>
    </el-menu-item>
    <el-menu-item index="/tools">
      <i class="iconfont icon-gongjuxiang1"></i>
      <span slot="title">
        <router-link to="/tools"> 实用工具</router-link>
      </span>
    </el-menu-item>

    <el-menu-item index="/admin/home" v-show="userinfo.username === 'admin'">
      <i class="iconfont icon-yonghu"></i>
      <span slot="title">
        <router-link to="/admin/home"> 后台登录</router-link>
      </span>
    </el-menu-item>
  </el-menu>
</template>

<script>
import { mapState } from "vuex";
export default {
  name: "Leftmenu",
  computed: {
    ...mapState("loginModule", ["userinfo"]),
  },
  // mounted() {
  //   console.log(this.userinfo.username);
  // },
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
i {
  font-size: 16px;
}
</style>