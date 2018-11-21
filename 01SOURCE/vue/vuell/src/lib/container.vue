<template>
    <el-container style="height: 700px; border: 1px solid #eee" :direction="direction">
      <slot></slot>
    </el-container>
</template>

<script>
export default {
  name: "ll-container",
  props: {
    // direction: {
    //   default() {
    //     return "";
    //   },
    //   type: String
    // }
  },
  data() {
    return {
      direction:""
    };
  },
  methods: {
    initDirection() {
      if (this.direction === "vertical") {
        return;
      } else if (this.direction === "horizontal") {
        return;
      }
      if (
        this.$slots && this.$slots.default
          ? this.$slots.default.some(vnode => {
              const tag = vnode.componentOptions && vnode.componentOptions.tag;
              return tag === "ll-header" || tag === "ll-footer";
            })
          : false
      ) {
        this.direction = "vertical";
      }
    }
  },
  created() {
    //设置
    this.initDirection();
  },
  mounted() {
    console.log(this.llData);
    console.log(this.$slots);
  }
};
</script>
