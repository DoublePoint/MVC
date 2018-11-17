<template>
    <el-aside>
      <slot></slot>
    </el-aside>
</template>

<script>
export default {
  name: "ll-aside",
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
