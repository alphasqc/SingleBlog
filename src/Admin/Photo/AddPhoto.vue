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
      <el-form-item label="描述" prop="title">
        <el-input
          type="text"
          v-model="ruleForm.title"
          autocomplete="off"
        ></el-input>
      </el-form-item>

      <el-form-item label="图片" prop="url">
        <el-upload
          class="avatar-uploader"
          :action="url"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload"
        >
          <img
            v-if="imageUrl"
            :src="imageUrl"
            class="avatar"
            title="点击上传图片"
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
export default {
  name: "AddPhoto",
  data() {
    return {
      url: base.uploadUrl,
      baseurl: "",
      imageUrl: "",
      ruleForm: {
        title: "",
        url: "",
      },
      rules: {
        title: [
          { required: true, message: "请输入描述", trigger: "blur" },
          { min: 1, max: 30, message: "长度在 2 到 30个字符", trigger: "blur" },
        ],
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
          let { title, url } = this.ruleForm;
          this.$api
            .addPhoto({
              title,
              url,
            })
            .then((res) => {
              if (res.data.status === 200) {
                this.$message({
                  message: "恭喜您，添加成功",
                  type: "success",
                });
                this.imageUrl = "";
                this.$refs.ruleForm.resetFields();
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
        message: "恭喜你，图片上传成功",
        type: "success",
      });
      this.ruleForm.url = this.baseurl + "/" + res.url.slice(7);
      console.log("图片地址", this.ruleForm.url);
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
  padding-top: 50px;
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
/deep/ .el-form-item {
  margin-top: 30px;
}
</style>