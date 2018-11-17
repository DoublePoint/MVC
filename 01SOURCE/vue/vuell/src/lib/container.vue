<template>
    <el-container :direction="direction">
      <slot></slot>
    </el-container>
</template>

<script>
export default {
  name: "ll-container",
  props: {
    direction: {
      default() {
        return "";
      },
      type: String
    }
  },
  data() {
    return {
      
    };
  },
  methods: {},
  mounted() {
    
    console.log(this.llData);
  }
};
</script>
