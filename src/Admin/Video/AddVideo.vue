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

      <el-form-item label="视频" prop="video">
        <VideoUpload @geturl="geturl" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')"
          >提交</el-button
        >
        <el-button type="primary" plain @click="fanhui">返回</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import VideoUpload from "../../components/VideoUpload/video-upload.vue";
import base from "../../api/base";
export default {
  components: { VideoUpload },
  name: "AddPhoto",
  data() {
    return {
      url: base.uploadUrl,
      baseurl: "",
      //   videoUrl: "",
      ruleForm: {
        title: "",
        video: "",
      },
      rules: {
        title: [
          { required: true, message: "请输入描述", trigger: "blur" },
          { min: 1, max: 30, message: "长度在 2 到 30个字符", trigger: "blur" },
        ],
        video: [{ required: true, message: "请上传视频", trigger: "blur" }],
      },
    };
  },
  mounted() {
    this.baseurl = base.host;
  },
  methods: {
    //通过自定义事件获取上传的视频的地址
    geturl(val) {
      this.ruleForm.video = val;
    },
    fanhui() {
      this.$router.push("/admin/home");
    },
    submitForm() {
      this.$refs.ruleForm.validate((valid) => {
        if (valid) {
          this.$message("已提交");
          let { title, video } = this.ruleForm;
          this.$api
            .addVideo({
              title,
              video,
            })
            .then((res) => {
              if (res.data.status === 200) {
                this.$message({
                  message: "恭喜您，添加成功",
                  type: "success",
                });
                this.$refs.ruleForm.resetFields();
                this.$bus.$emit("deletevideo");
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
      this.$bus.$emit("deletevideo");
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