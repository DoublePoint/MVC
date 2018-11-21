<template>
    <el-tabs v-model="activeName" @tab-click="tabClick">
      <slot></slot>
    </el-tabs>
</template>

<script>
export default {
  name: "ll-tab",
  // model: {  // 使用model， 这儿2个属性，prop属性说，我要将msg作为该组件被使用时（此处为aa组件被父组件调用）v-model能取到的值，event说，我emit ‘cc' 的时候，参数的值就是父组件v-model收到的值。
  //  prop: 'activeName',
  //  event: 'cc'
  // },
  props: {
    // activeName: {
    //   default() {
    //     return "";
    //   },
    //   type: String
    // },
  },
  data() {
    return {
      activeName:"bg"
    };
  },
  methods: {
    tabClick(val){
      alert(3);
      this.$emit('tab-click',val);
    },
    cc(){
      alert("cc");
    }
  },
  mounted() {
  }
};
</script>
