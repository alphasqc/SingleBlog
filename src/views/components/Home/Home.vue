<template>
  <div class="main">
    <div class="swiper"><Swiper /></div>
    <div class="introduct">
      <div class="top">
        <img src="../../../assets/img/introduct.png" alt="" /> 博客介绍
      </div>
      <div class="zxl">
        <el-collapse accordion>
          <el-collapse-item>
            <template slot="title"> 个人介绍 </template>
            <div class="lw">
              <p>• 重庆工程学院-23届-软件工程，目前📍：合肥</p>
              <p>• 未来希望成为一名优秀的前端程序🐵</p>
              <p>
                •
                平时热爱学习，也喜欢逛一些像掘金，CSND，简书等论坛，学习更多关于前端的知识
              </p>
            </div>
          </el-collapse-item>
          <el-collapse-item title="本站介绍">
            <div class="lw">
              <p>
                • 该博客包含了前台和后台，使用Vue+Element
                UI+Echarts进行开发，后端使用的是Node和mysql数据库，
                搭建博客的初衷是希望把自己平常学习生活中学到的知识点或者遇到的难题，亦或是有趣的事情记录下来
              </p>
              <p>
                •
                本人也还只是个前端菜鸟，代码可能也很菜，如果有什么建议，请留言告知，都会虚心受教的并且给予回复的！
              </p>
            </div>
          </el-collapse-item>
          <el-collapse-item title="联系方式">
            <div class="lw">
              <p>• QQ : 554736248</p>
              <p>• 邮箱 : sqc19990726@163.com</p>
              <p>• 微信: sqc554736248</p>
            </div>
          </el-collapse-item>
        </el-collapse>
      </div>
    </div>
    <div class="article">
      <div class="top">
        <img src="../../../assets/img/new.png" alt="" /> 最新文章
      </div>
      <div class="content">
        <ArticleItem
          :article="article"
          v-for="(item, index) in article"
          :key="index"
          :item="item"
        />
      </div>
    </div>
  </div>
</template>
<script>
import moment from "moment";
import Swiper from "../../../components/Swiper/Swiper";
import ArticleItem from "../../../components/ArticleItem/ArticleItem";
export default {
  name: "Home",
  components: { Swiper, ArticleItem },
  data() {
    return {
      article: [],
    };
  },
  methods: {
    // 获取文章列表
    http(page) {
      this.$api
        .getArticleHave({
          page,
        })
        .then((res) => {
          if (res.data.status === 200) {
            // console.log(res.data.data);
            res.data.data.forEach((data) => {
              data.tag = data.tag.split(",").map((item) => item * 1);
              data.created_at = moment(data.created_at).format(
                "YYYY-MM-DD HH:mm:ss"
              );
            });
            this.article = res.data.data.slice(0, 5);
            // console.log(" this.article", this.article);
            this.total = res.data.total;
            this.pageSize = res.data.pageSize;
          }
        });
    },
  },
  created() {
    this.http(1);
  },
};
</script>

<style lang="less" scoped>
* {
  margin: 0;
  padding: 0;
}
.main {
  box-sizing: border-box;
  position: relative;
  font-size: 16px;
  padding-top: 10px;
  padding-left: 25px;
  padding-bottom: 10px;
  width: 600px;
  height: auto;
  margin: 50px auto;
  background-color: azure;
  // background-color: rgba(0, 0, 0, 0.5);
  // background-color: #999999;
}
.swiper {
  width: 95%;
  height: auto;
  // background-color: white;
}
.article {
  width: 95%;
  height: auto;
}
.top img {
  width: 30px;
  height: 30px;
  vertical-align: middle;
}
.top {
  margin-bottom: 10px;
  margin-top: 10px;
}
.zxl {
  width: 95%;
  height: auto;
}
.lw {
  padding-left: 12px;
  p {
    font-style: 16px;
    color: #999;
  }
}
</style>