<template>
    <ll-menu
        :collapse="collapse"
        :background-color="backgroundColor"
        :text-color="textColor"
        unique-opened >       
        <ll-nav-menu-item :items="items"></ll-nav-menu-item>
    </ll-menu>
</template>

<script>
import Vuex from 'vuex'
Vue.use(Vuex)
import menuItem from "./menu-item.vue"; //引进菜单模板
const store = new Vuex.Store({
  state: {
    menuCollapse: false
  },
  mutations: {
    setMenuCollapseFalse(state) {
      state.menuCollapse=false;
    },
    setMenuCollapseTrue(state) {
      state.menuCollapse=true;
    }
  }
});
export default {
  name: "LlNavMenu",
  store,
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
      default(){
        return true
      },
      type:Boolean
    }
  },
  data() {
    return {
    };
  },
  methods: {
    toggleClick() {
      //菜单展开功能
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
  .el-menu-vertical-demo:not(.el-menu--collapse) {
    width: 200px;
  }
</style>