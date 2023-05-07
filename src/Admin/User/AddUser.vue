<template>
  <div class="main">
    <el-form
      :model="ruleForm"
      status-icon
      :rules="rules"
      ref="ruleForm"
      label-width="100px"
      label-height="100px"
      class="demo-ruleForm"
    >
      <el-form-item label="用户名" prop="username">
        <el-input
          type="text"
          v-model="ruleForm.username"
          autocomplete="off"
        ></el-input>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input
          type="password"
          v-model="ruleForm.password"
          autocomplete="off"
        ></el-input>
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input
          type="email"
          v-model="ruleForm.email"
          autocomplete="off"
        ></el-input>
      </el-form-item>
      <el-form-item label="昵称" prop="nickname">
        <el-input v-model="ruleForm.nickname"></el-input>
      </el-form-item>
      <el-form-item label="年龄" prop="age">
        <el-input v-model.number="ruleForm.age"></el-input>
      </el-form-item>
      <el-form-item label="性别" prop="sex">
        <el-radio text="radio" v-model="ruleForm.sex" label="男">男</el-radio>
        <el-radio text="radio" v-model="ruleForm.sex" label="女">女</el-radio>
      </el-form-item>
      <el-form-item label="个人介绍" prop="introduction">
        <el-input
          type="textarea"
          resize="none"
          maxlength="50"
          show-word-limit
          :autosize="{ minRows: 3, maxRows: 6 }"
          v-model="ruleForm.introduction"
        ></el-input>
      </el-form-item>
      <el-form-item label="个人头像" prop="avatar">
        <el-upload
          class="avatar-uploader"
          :action="url"
          :show-file-list="false"
          :before-upload="beforeAvatarUpload"
        >
          <img
            v-if="imageUrl"
            :src="imageUrl"
            class="avatar"
            title="点击更改头像"
          />
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')"
          >提交</el-button
        >
        <el-button @click="resetForm('ruleForm')">重置</el-button>
        <el-button type="primary" plain @click="fanhui">返回</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import base from "../../api/base";
import moment from "moment";
export default {
  name: "AddUser",
  data() {
    var checkAge = (rule, value, callback) => {
      setTimeout(() => {
        if (!Number(value)) {
          callback(new Error("请输入数字值"));
        } else {
          if (value < 1 || value > 100) {
            callback(new Error("年龄格式错误"));
          } else {
            callback();
          }
        }
      }, 1000);
    };
    return {
      url: base.uploadUrl,
      imageUrl: "",
      ruleForm: {
        username: "",
        password: "",
        email: "",
        sex: "",
        age: "",
        avatar: "",
        nickname: "",
        introduction: "",
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          { min: 2, max: 10, message: "长度在 2 到 10个字符", trigger: "blur" },
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { min: 6, max: 20, message: "长度在 6 到 20个字符", trigger: "blur" },
        ],
        email: [
          { required: true, message: "请输入邮箱地址😊", trigger: "blur" },
          {
            type: "email",
            message: "请输入正确的邮箱地址😊",
            trigger: ["blur", "change"],
          },
        ],
        age: [{ validator: checkAge, trigger: "blur" }],
      },
    };
  },
  mounted() {
    this.baseurl = base.host;
  },
  methods: {
    fanhui() {
      this.$router.push("/admin/home");
    },
    submitForm() {
      this.$refs.ruleForm.validate((valid) => {
        if (valid) {
          this.$message("已提交");
          // console.log(this.ruleForm);
          let created_at = moment().format("YYYY-MM-DD HH:mm:ss");
          let {
            username,
            password,
            email,
            sex,
            age,
            avatar,
            nickname,
            introduction,
          } = this.ruleForm;
          this.$api
            .getRegister({
              username,
              password,
              email,
              sex,
              age,
              avatar,
              nickname,
              introduction,
              created_at,
            })
            .then((res) => {
              if (res.data.status === 200) {
                this.$message({
                  message: "恭喜您，添加成功",
                  type: "success",
                });
                this.imageUrl = "";
                this.$refs.ruleForm.resetFields();
              } else if (res.data.status === 304) {
                this.$message({
                  showClose: true,
                  message: "警告哦，该账号已存在😊",
                  type: "warning",
                });
              } else if (res.data.status === 520) {
                this.$message({
                  message: "您未进行任意更新操作😊",
                  type: "warning",
                });
              }
            });
        } else {
          this.$message.error("提交失败");
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    // 上传图片成功
    handleAvatarSuccess(res, file, fileList) {
      console.log("上传成功了", res, file, fileList);
      this.imageUrl = URL.createObjectURL(file.raw);
      // console.log(file.raw.name, ".........", res.url);
      // const imgurl = file.raw.name;
      this.$message({
        message: "恭喜你，图片上传成功成功",
        type: "success",
      });
      this.ruleForm.avatar = this.baseurl + "/" + res.url.slice(7);
      console.log("图片地址", this.ruleForm.avatar);
    },

    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isLt3M = file.size / 1024 / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG 格式!");
      }
      if (!isLt3M) {
        this.$message.error("上传头像图片大小不能超过 3MB!");
      }
      return isJPG && isLt3M;
    },
  },
};
</script>
<style lang="less" scoped>
.main {
  padding-top: 29px;
  padding-left: 15px;
  padding-right: 30px;
  width: 70%;
  min-height: 500px;
  margin: 30px auto;
  background-color: rgba(0, 0, 0, 0.5);
}
button:first-child {
  margin-left: 103px;
}
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
  background-color: white;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
label {
  color: red;
}
/deep/ .el-form-item__label {
  color: aqua;
}
/deep/ .el-button {
  margin-left: 80px;
}
</style>