<template>
    <div class="ll-menu-div">
        <template v-for="item in this.items" >  
            <!-- if -->
            <ll-submenu v-if="item[props.children]!=null&&item[props.children].length>0" :key="item[props.id]" :index="item[props.id]"  > 
                <template slot="title"  style="padding-left:10px" >
                    <i v-if="item[props.icon]!=null&&item[props.icon]!=''" class="menu-icon" :class="item[props.icon]"></i>
                    <span slot="title">{{item[props.label]}}</span>
                </template>
                <ll-menu-item-zz  :props="props" @testclick="testclick" :items="item[props.children]"></ll-menu-item-zz> 
            </ll-submenu>
            <!-- else -->
            <ll-menu-item v-else :index="item[props.id]" :route="item"  :key="item[props.id]" >
                <i v-if="item[props.icon]!=null&&item[props.icon]!=''"  class="menu-icon" :class="item[props.icon]"></i>
                <span @mouseenter="testclick">{{item[props.label]}}</span>
            </ll-menu-item>
        </template>
    </div>
</template>

<script>
import menuItem from "./menu-item.vue"; //引进菜单模板
export default {
  name: "LlMenuItemZz",
  components: {
    "LlMenuItemZz": menuItem //使用菜单组件
  },
  props: {
    items: {
      default() {
        return [];
      },
      type: Array
    },
    props:{
      default() {
        return {
          children: String,
          id: String,
          label: String,
          icon: String,
        }
      },
      type: Object
    }
    
  },
  computed:{
    
    //  isCollapse () {
    //     return this.$store.state.menuCollapse;
    // }
  },
  data() {
    return {};
  },
  methods: {
    testclick(){
      this.$emit('testclick')
    }
  },
  
  created() {
    
  },
  mounted() {
    // console.log("---------------------------------"+this.$parent);
  }
};
</script>

<style lang="less" scoped>
.menu-icon{
  color:#FFFFFF;
}
</style>
