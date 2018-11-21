<template>
      <el-tab-pane @tabClick="tabPaneClick" :label="label" :name="name">
        <slot></slot>
      </el-tab-pane>
</template>

<script>
export default {
  name: "ll-tab-pane",
  props: {
    name: {
      default() {
        return "";
      },
      type: String
    },
    label: {
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
  methods: {
    tabPaneClick(){
      alert(2);
      this.$emit("tabPaneCick",this.name);
    }
  },
  mounted() {
  }
};
</script>
