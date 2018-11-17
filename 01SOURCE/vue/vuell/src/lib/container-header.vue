<template>
    <el-header>
      <slot></slot>
    </el-header>
</template>

<script>
export default {
  name: "ll-header",
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
