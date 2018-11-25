<template>
    <ll-menu
        :collapse="collapse"
        :background-color="backgroundColor"
        :text-color="textColor"
        @select="select"
        @itemClick="itemClick"
        unique-opened >       
        <ll-nav-menu-item :items="items" :idAlias="idAlias" :labelAlias="labelAlias" :childAlias="childAlias"></ll-nav-menu-item>
    </ll-menu>
</template>

<script>
// import Vuex from 'vuex'
// Vue.use(Vuex)
import menuItem from "./menu-item.vue"; //引进菜单模板
// const store = new Vuex.Store({
//   state: {
//     menuCollapse: false
//   },
//   mutations: {
//     setMenuCollapseFalse(state) {
//       state.menuCollapse=false;
//     },
//     setMenuCollapseTrue(state) {
//       state.menuCollapse=true;
//     }
//   }
// });
export default {
  name: "LlNavMenu",
  // store,
  components: {
    "LlNavMenuItem": menuItem //使用菜单组件
  },
  props: {
    items: {
      default() {
        return [];
      },
      type: Array
    },
    idAlias: {
      default(){
        return "id"
      },
      type:String
    },
    labelAlias: {
      default(){
        return "label"
      },
      type:String
    },
    childAlias: {
      default(){
        return "children"
      },
      type:String
    },
    backgroundColor: {
      default(){
        return "#EEE"
      },
      type:String
    },
    textColor: {
      default(){
        return "#FFF"
      },
      type:String
    },
    collapse:{
      type:Boolean
    }
  },
  data() {
    return {
    };
  },
  methods: {
    select(index, indexPath, item) {
      //菜单展开功能
      this.$emit("select",index, indexPath, item.route);
    },
    itemClick(index, indexPath, item){
      alert(2)
    }
  },
  watch:{
    collapse(value){
      if(value){
        console.log('setMenuCollapseTrue')
        store.commit('setMenuCollapseTrue')
      }
      else{
        console.log('setMenuCollapseFalse')
        store.commit('setMenuCollapseFalse')
      }
    }
  }
};
</script>

<style>
  .el-menu {
    border-right: 0; 
  }
</style>