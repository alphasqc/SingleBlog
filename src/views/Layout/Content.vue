<template>
  <!-- 内容区域，路由出口 -->
  <div class="content">
    <keep-alive include="Article">
      <router-view></router-view>
    </keep-alive>
  </div>
</template>

<script>
export default {
  name: "Content",
};
</script>

<style lang="less" scoped>
.content {
  position: relative;
  z-index: -1;
  flex: 1;
  margin-top: 15px;
  max-height: 50px;
  margin-right: 400px;
  margin-left: 380px;
}
</style>