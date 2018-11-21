<template>
    <el-tabs v-model="activeName" @tab-click="tabClick">
      <slot></slot>
    </el-tabs>
</template>

<script>
export default {
  name: "ll-tab",
  props: {
    // activeName: {
    //   default() {
    //     return "";
    //   },
    //   type: String
    // },
  },
  data() {
    return {
      activeName:""
    };
  },
  methods: {
    tabClick(val){
      this.$emit('tab-click',val);
    }
  },
  mounted() {
  }
};
</script>
