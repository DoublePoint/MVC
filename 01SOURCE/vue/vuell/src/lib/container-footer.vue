<template>
    <el-footer>
      <slot></slot>
    </el-footer>
</template>

<script>
export default {
  name: "ll-footer",
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
