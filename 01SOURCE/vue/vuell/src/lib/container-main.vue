<template>
    <el-main>
      <slot></slot>
    </el-main>
</template>

<script>
export default {
  name: "ll-main",
  props: {
    rows: {
      default() {
        return "";
      },
      type: String
    }
  },
  data() {
    return {
      //llData: []
    };
  },
  methods: {},
  mounted() {
    //this.llData = this.data;
    console.log(this.llData);
    11;
  }
};
</script>
