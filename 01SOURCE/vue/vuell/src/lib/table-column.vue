<template>
    <el-table-column :prop="prop" :label="label" :width="width">
    </el-table-column>
</template>

<script>

export default {
  name: "ll-column",
 
  props: {
    prop: {
      default() {
        return [];
      },
      type: String
    },
    label: {
      default() {
        return "";
      },
      type: String
    },
    width: {
      type: Number
    },
  },
  data() {
    return {
      //llData: []
    };
  },
  methods: {},
  mounted() {
    //this.llData = this.data;
    // console.log(this.llData);11
  }
};
</script>
