<template>
    <el-footer :height="height">
      <slot></slot>
    </el-footer>
</template>

<script>
export default {
  name: "ll-footer",
  props: {
    height: {
      default() {
        return "60px";
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
