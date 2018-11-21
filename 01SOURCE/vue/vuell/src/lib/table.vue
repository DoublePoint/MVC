<template>
    <el-table
      :data="data"
      style="width: 100%">
      <slot></slot>
     </el-table>
</template>

<script>
export default {
  name: "ll-table",
  props: {
    data: {
      default() {
        return [];
      },
      type: Array
    }
  },
  data() {
    return {
      //llData: []
    };
  },
  methods: {},
  mounted() {
    console.log(this.llData);
  }
};
</script>
