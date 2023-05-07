<template>
  <div class="main">
    <!-- 顶部区域 -->
    <div class="header">
      <div class="logo">后台（维护中）</div>
      <el-row>
        <el-col :span="24"
          ><div class="grid-content bg-purple-dark"></div
        ></el-col>
      </el-row>
      <div class="admin" v-show="admininfo.adminname">
        欢迎管理员：{{ admininfo.adminname }}
        <span class="zxl" @click="loginout"
          ><i class="el-icon-loading"></i> 退出登录</span
        >
      </div>
    </div>
    <!-- 内容区域 -->
    <div class="layout">
      <Mymenu class="menu" :admin="admininfo.adminname"></Mymenu>
      <Content class="content" :admin="admininfo.adminname"></Content>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import { mapMutations } from "vuex";
import Content from "./Content";
import Mymenu from "./Mymenu";
export default {
  name: "index",
  data() {
    return {
      bodyImg: "url(" + require("../../assets/img/adminloginbg.jpg") + ")",
    };
  },
  components: {
    Content,
    Mymenu,
  },
  computed: {
    ...mapState("AdminLogin", ["admininfo"]),
  },
  mounted() {
    document.body.style.backgroundImage = this.bodyImg;
    document.body.style.backgroundSize = "100%";
    document.body.style.backgroundAttachment = "fixed";
    console.log("bbbbbb", this.admininfo.adminname);
    if (this.admininfo.adminname === "") {
      this.$confirm("您还未登录后台, 是否登录?", "温馨提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          this.$message({
            type: "success",
            message: "请登录!",
          });
          this.$router.push("/adminlogin");
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消",
          });
          this.$router.go(-1);
        });
    }
  },
  methods: {
    ...mapMutations("AdminLogin", ["clearAdmin"]),
    ...mapMutations("AdminLoginAddress", ["clearAddress"]),

    //退出登录
    loginout() {
      //清空vuex数据
      this.clearAdmin();
      this.clearAddress();
      //清空本地数据
      localStorage.removeItem("lwandzxl");
      localStorage.removeItem("lwandzxladdress");
      //返回登录
      this.$router.push("/adminlogin");
    },
  },
};
</script>

<style lang="less" scoped>
.layout {
  width: 100%;
  height: 100%;
  display: flex;

  .content {
    z-index: -1;
    flex: 1;
    min-width: 400px;
    margin-top: 15px;
    max-height: 50px;
    margin-left: 200px;
    // background-color: red;
  }
}
.admin {
  color: aqua;
  font-size: 16px;
  position: absolute;
  top: 5px;
  right: 20px;
}
span {
  font-size: 16px;
  z-index: -99;
  color: red;
  cursor: pointer;
  margin-left: 10px;
}
i {
  font-style: normal;
}
.header {
  position: relative;
  z-index: 0;
  position: fixed;
  top: 0;
  height: 30px;
  width: 100%;
  // background-color: red;
  // background-color: #00879e;
  .logo {
    position: absolute;
    display: flex;
    width: 300px;
    height: 100%;
    margin-left: 40px;
    font-size: 2rem;
    color: black;
  }
}
.el-row {
  margin-bottom: 20px;
  &:last-child {
    margin-bottom: 0;
  }
}
// .el-col {
//   border-radius: 4px;
// }
.bg-purple-dark {
  background: #99a9bf;
}
.bg-purple {
  background: #d3dce6;
}
.bg-purple-light {
  background: #e5e9f2;
}
.grid-content {
  // border-radius: 4px;
  min-height: 36px;
}
.row-bg {
  padding: 10px 0;
  background-color: #f9fafc;
}
</style>