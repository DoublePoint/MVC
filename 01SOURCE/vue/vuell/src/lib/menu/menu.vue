<template>
    <ll-menu
        :collapse="collapse"
        :background-color="backgroundColor"
        :text-color="textColor"
        @select="select"
        @itemClick="itemClick"
        unique-opened >       
        <ll-nav-menu-item :items="items" :props="props"></ll-nav-menu-item>
    </ll-menu>
</template>

<script>
import menuItem from "./menu-item.vue"; //引进菜单模板

export default {
  name: "LlNavMenu",
  components: {
    "LlNavMenuItem": menuItem //使用菜单组件
  },
  props: {
    items: {
      default: [],
      type: Array
    },
    props:{
      default(){
        return{
          children: "children",
          id: "id",
          label: "label",
          icon: "icon",
        }
      },
      type:Object
    },
    backgroundColor: {
      default: "#EEE",
      type:String
    },
    textColor: {
      default: "#FFF",
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