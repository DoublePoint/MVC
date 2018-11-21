<template>
    <el-menu
        class="el-menu-vertical-demo"
        :collapse="isCollapse"
        unique-opened >       
        <ll-menu-item :items="items"></ll-menu-item>
    </el-menu>
</template>

<script>
import menuItem from "./menu-item.vue"; //引进菜单模板
export default {
  name: "ll-menu",
  props: {
    items: {
      default() {
        return [];
      },
      type: Array
    }
  },
  data() {
    return {
      isCollapse: false, //菜单展开功能
    };
  },
  methods: {
    toggleClick() {
      //菜单展开功能
      this.isCollapse = !this.isCollapse;
    }
  },
  components: {
    "ll-menu-item": menuItem //使用菜单组件
  }
};
</script>

<style>
  .el-menu-vertical-demo:not(.el-menu--collapse) {
    width: 200px;
  }
</style>